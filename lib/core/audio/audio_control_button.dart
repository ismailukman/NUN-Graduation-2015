import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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

    return StreamBuilder<PlayerState>(
      stream: audioManager.playerStateStream,
      initialData: audioManager.isPlaying
          ? PlayerState(true, ProcessingState.ready)
          : PlayerState(false, ProcessingState.idle),
      builder: (context, snapshot) {
        final isPlaying = snapshot.data?.playing ?? audioManager.isPlaying;

        return IconButton(
          icon: Icon(
            isPlaying ? Icons.volume_up : Icons.volume_off,
            size: iconSize,
          ),
          color: iconColor ?? Theme.of(context).colorScheme.primary,
          onPressed: () async {
            if (isPlaying) {
              await audioManager.stop();
            } else {
              await audioManager.play();
            }
          },
          tooltip: isPlaying ? 'Mute music' : 'Play music',
        );
      },
    );
  }
}
