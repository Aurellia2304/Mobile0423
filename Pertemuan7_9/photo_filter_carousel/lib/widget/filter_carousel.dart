import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'filter_selector.dart';

class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  XFile? _capturedImage;
  bool _isCameraInitialized = false;

  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.medium,
        );
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final image = await _cameraController!.takePicture();
        setState(() {
          _capturedImage = image;
        });
      } catch (e) {
        print('Error taking picture: $e');
      }
    }
  }

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  void _resetCamera() {
    setState(() {
      _capturedImage = null;
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _filterColor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Camera Preview atau Captured Image
          Positioned.fill(
            child: _capturedImage == null
                ? (_isCameraInitialized && _cameraController != null
                      ? CameraPreview(_cameraController!)
                      : Container(color: Colors.black))
                : ValueListenableBuilder(
                    valueListenable: _filterColor,
                    builder: (context, color, child) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(
                            File(_capturedImage!.path),
                            fit: BoxFit.cover,
                          ),
                          Container(
                            color: color.withOpacity(0.5),
                            child: const SizedBox.expand(),
                          ),
                        ],
                      );
                    },
                  ),
          ),

          // Tombol Kamera (bawah tengah)
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _capturedImage == null ? _takePicture : _resetCamera,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    _capturedImage == null ? Icons.camera_alt : Icons.replay,
                    color: Colors.black87,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),

          // Tombol Close/Back (atas kiri)
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 28),
              ),
            ),
          ),

          // Filter Selector (bawah)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSelector() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text indikator
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            _capturedImage == null
                ? 'Ambil foto dulu ya!'
                : 'Geser untuk pilih filter',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ),
        FilterSelector(
          onFilterChanged: _onFilterChanged,
          filters: _filters,
          enabled: _capturedImage != null, // Hanya aktif jika sudah ada foto
        ),
      ],
    );
  }
}
