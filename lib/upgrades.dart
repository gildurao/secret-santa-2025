import 'package:flutter/material.dart';
import 'package:secret_santa/const/resource.dart';
import 'package:secret_santa/expandable_fab.dart';
import 'package:secret_santa/main.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';

const _landCards = [
  R.ASSETS_OTC_290_DROWNED_CATACOMB_PNG,
  R.ASSETS_MH3_244_FELL_THE_PROFANE_JPG,
  R.ASSETS_MH3_244_FELL_MIRE_JPG,
  R.ASSETS_MH3_224_POLLUTED_DELTA_PNG,
  R.ASSETS_LTR_259_RIVENDELL_PNG,
  R.ASSETS_MH3_241_SINK_INTO_STUPOR_JPG,
  R.ASSETS_MH3_241_SOPORIFIC_SPRINGS_JPG,
  R.ASSETS_2XM_326_SUNKEN_RUINS_PNG,
  R.ASSETS_MKM_270_UNDERCITY_SEWERS_PNG,
  R.ASSETS_DSC_321_UNDERGROUND_RIVER_PNG,
];

const _bigBoys = [
  R.ASSETS_CLB_724_HULLBREAKER_HORROR_PNG,
  R.ASSETS_THB_291_SERPENT_OF_YAWNING_DEPTHS_PNG,
  R.ASSETS_C21_33_SPAWNING_KRAKEN_PNG,
  R.ASSETS_9ED_105_TIDAL_KRAKEN_PNG,
];

const _reorganizeLibrary = [
  R.ASSETS_ROE_96_BANEFUL_OMEN_PNG,
  R.ASSETS_WAR_79_BOLAS_S_CITADEL_PNG,
  R.ASSETS_BLC_14_FORTUNE_TELLER_S_TALENT_PNG,
  R.ASSETS_2XM_56_JACE_THE_MIND_SCULPTOR_PNG,
  R.ASSETS_C13_197_LIM_DUL_S_VAULT_PNG,
  R.ASSETS_FUT_41_MYSTIC_SPECULATION_PNG,
  R.ASSETS_CMR_337_SCROLL_RACK_PNG,
  R.ASSETS_2X2_314_SENSEI_S_DIVINING_TOP_PNG,
  R.ASSETS_MMQ_104_SOOTHSAYING_PNG,
];

const _copyCommander = [
  R.ASSETS_WHO_36_AUTON_SOLDIER_PNG,
  R.ASSETS_CMR_90_SAKASHIMA_S_PROTEGE_PNG,
  R.ASSETS_CMR_89_SAKASHIMA_OF_A_THOUSAND_FACES_PNG,
  R.ASSETS_SOK_53_SAKASHIMA_THE_IMPOSTOR_PNG,
  R.ASSETS_RVR_62_SPARK_DOUBLE_PNG,
];

const _protectionAndRemoval = [
  R.ASSETS_SNC_51_AN_OFFER_YOU_CAN_T_REFUSE_PNG,
  R.ASSETS_DSC_114_COUNTERSPELL_PNG,
  R.ASSETS_CLB_842_DROWN_IN_THE_LOCH_PNG,
  R.ASSETS_RAV_217_PERPLEX_PNG,
  R.ASSETS_OTC_106_PONGIFY_PNG,
  R.ASSETS_MH3_277_TOXIC_DELUGE_PNG,
  R.ASSETS_DSK_124_WITHERING_TORMENT_PNG,
];

const _topDeck = [
  R.ASSETS_OTJ_48_FBLTHP_LOST_ON_THE_RANGE_PNG,
  R.ASSETS_DSC_121_ONE_WITH_THE_MULTIVERSE_PNG,
  R.ASSETS_NEO_74_THE_REALITY_CHIP_PNG,
];

class Upgrades extends StatefulWidget {
  const Upgrades({super.key});

  @override
  State<Upgrades> createState() => _UpgradesState();
}

class _UpgradesState extends State<Upgrades> {
  final videoController = VideoPlayerController.asset(
    'assets/videos/underwater.mp4',
  );
  bool flag = false;

  @override
  void initState() {
    super.initState();
    videoController.initialize().then((_) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          setState(() {
            flag = true;
            videoController.setVolume(0);
            videoController.setLooping(true);
            videoController.play();
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: UpgradesContent(),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: flag ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: Opacity(
                opacity: 0.15,
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UpgradesContent extends StatefulWidget {
  const UpgradesContent({super.key});

  @override
  State<UpgradesContent> createState() => _UpgradesContentState();
}

class _UpgradesContentState extends State<UpgradesContent> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: scrollController,
        children: [
          MainSectionText(
            text: 'MARVO, DEEP OPERATIVE',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w700,
              fontSize: 128,
              color: context.colorScheme.onPrimary,
            ),
          ),
          MainSectionText(
            text: 'DECK UPGRADES',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w700,
              fontSize: 64,
              color: context.colorScheme.tertiary,
            ),
          ),
          spacing,
          Text(
            'This page contains a few cards which you can leverage to upgrade your Marvo Deck. Remember, it is always about clashing and having big cards at the top of your deck!',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'LANDS',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                for (final land in _landCards) CardPreview(asset: land),
              ],
            ),
          ),
          spacing,
          Text(
            'Land upgrades include staples such as the Dimir surveil, shock, and pain lands.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          Text(
            'I have also included other MFCs, like Sink Into Stupor // Soporific Springs and Fell the Profane // Fell Mire, for extra protection and removal',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'COPY COMMANDER',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                for (final copy in _copyCommander) CardPreview(asset: copy),
              ],
            ),
          ),
          spacing,
          Text(
            'Did you know that Octopi have the ability to regenerate their tentacles?\nChange your deck to match reality and give it steroids by copying Marvo over and over again and clashing even more times!',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'REORGANIZE YOUR LIBRARY',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                for (final reorganize in _reorganizeLibrary)
                  CardPreview(asset: reorganize),
              ],
            ),
          ),
          spacing,
          Text(
            'Upgrade your top deck capabilities with staples like Sensei\'s Divining Top, Jace, the Mind Sculptor and Soothsaying.\nDoes your hand suck? Or do you have a big creature in your hand you could clash with? Activate Scroll Rack or cast Lim-Dûl\'s Vault and set yourself up for success!\n',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'BIG BOYS FROM THE DEPTHS OF THE SEA',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                for (final bigBoy in _bigBoys) CardPreview(asset: bigBoy),
              ],
            ),
          ),
          spacing,
          Text(
            'Improve your deep sea monsters by making them unblockable with Serpent of Yawning Depths.\nCreate more sea creatures with Spawning Kraken.\nPlay Hullbreaker Horror for a more protective stance.\nThe fun never ends!',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'PROTECTION AND REMOVAL',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                for (final protection in _protectionAndRemoval)
                  CardPreview(asset: protection),
              ],
            ),
          ),
          spacing,
          Text(
            'Improve your protection and removal by adding blue and black staples like Counterspell, Perplex, Pongify or Toxic Deluge.\nScary!',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'TOP DECK',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              children: [
                for (final topDeckCard in _topDeck)
                  CardPreview(asset: topDeckCard),
              ],
            ),
          ),
          spacing,
          Text(
            'A Cowboy and a Rogue Octopus walk into a bar... and the universe implodes and reality does not make sense anymore.\nCare to chip in?',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'SWITCHING CARDS (some suggestions)',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 64,
            ),
          ),
          spacing,
          spacing,
          const _CardSwitch(
            from: R.ASSETS_MH1_53_FUTURE_SIGHT_PNG,
            to: R.ASSETS_DSC_121_ONE_WITH_THE_MULTIVERSE_PNG,
          ),
          spacing,
          const _CardSwitch(
            from: R.ASSETS_DSC_136_DECREE_OF_PAIN_PNG,
            to: R.ASSETS_MH3_277_TOXIC_DELUGE_PNG,
          ),
          spacing,
          const _CardSwitch(
            from: R.ASSETS_DMR_40_AVEN_FATESHAPER_PNG,
            to: R.ASSETS_2X2_314_SENSEI_S_DIVINING_TOP_PNG,
          ),
          spacing,
          const _CardSwitch(
            from: R.ASSETS_SOK_33_DESCENDANT_OF_SORAMARO_PNG,
            to: R.ASSETS_MMQ_104_SOOTHSAYING_PNG,
          ),
          spacing,
          const _CardSwitch(
            from: R.ASSETS_DSC_242_BRAINSTONE_PNG,
            to: R.ASSETS_2XM_56_JACE_THE_MIND_SCULPTOR_PNG,
          ),
          spacing,
          const _CardSwitch(
            from: R.ASSETS_DMR_56_IMPULSE_PNG,
            to: R.ASSETS_C13_197_LIM_DUL_S_VAULT_PNG,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'MARVO, DEEP OPERATIVE',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w700,
              fontSize: 128,
              color: context.colorScheme.onPrimary,
            ),
          ),
          MainSectionText(
            text: 'DECK UPGRADES',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w700,
              fontSize: 64,
              color: context.colorScheme.tertiary,
            ),
          ),
        ],
      ),
      floatingActionButton: ExpandableFab(
        distance: 128,
        children: [
          ActionButton(
            onPressed: () => launchUrlString(
              'https://tappedout.net/mtg-decks/secret-santa-20-25/',
            ),
            icon: Image.asset('assets/tappedout.png'),
            message: 'Deck List (TappedOut)',
          ),
          ActionButton(
            onPressed: () => scrollController
                .jumpTo(scrollController.position.minScrollExtent),
            icon: const Icon(Icons.move_up),
            message: 'Scroll to top',
          ),
          ActionButton(
            onPressed: () => scrollController
                .jumpTo(scrollController.position.maxScrollExtent),
            icon: const Icon(Icons.move_down),
            message: 'Scroll to bottom',
          ),
          ActionButton(
            onPressed: () => Navigator.of(context).pushNamed('/'),
            icon: const Icon(Icons.home),
            message: 'Back Home',
          ),
        ],
      ),
    );
  }
}

class _CardSwitch extends StatelessWidget {
  const _CardSwitch({
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 32,
        runSpacing: 32,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CardPreview(asset: from),
          const Icon(
            Icons.arrow_forward,
            size: 128,
          ),
          CardPreview(asset: to),
        ],
      ),
    );
  }
}
