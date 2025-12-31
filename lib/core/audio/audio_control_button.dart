import 'package:flutter/material.dart';

import '../utils/audio_manager.dart';

/// Simple audio control button using StreamBuilder
///
/// This widget provides a simple play/stop toggle for background music
/// without complex state management.
class AudioControlButton extends StatelessWidget {
  final Color? iconColor;
  final double iconSize;

  const AudioControlButton({
    super.key,
    this.iconColor,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final audioManager = AudioManager();

    return StreamBuilder<bool>(
      stream: audioManager.playingStream,
      initialData: audioManager.isPlaying,
      builder: (context, snapshot) {
        final isPlaying = snapshot.data ?? false;

        return IconButton(
          icon: Icon(
            isPlaying ? Icons.stop : Icons.play_arrow,
            size: iconSize,
          ),
          color: iconColor ?? Theme.of(context).colorScheme.primary,
          onPressed: () async {
            await audioManager.togglePlayPause();
          },
          tooltip: isPlaying ? 'Stop music' : 'Play music',
        );
      },
    );
  }
}
