import 'dart:math';

import 'package:flutter/material.dart';
import 'package:secret_santa/const/resource.dart';
import 'package:secret_santa/expandable_fab.dart';
import 'package:secret_santa/rotating_shining_card.dart';
import 'package:secret_santa/theme.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';

const theme = MaterialTheme(TextTheme());

const spacing = SizedBox(height: 32);

const creepsterFont = 'Creepster';
const nablaFont = 'Nabla';

const landCards = [
  CardAssets.ASSETS_DSK_279_ISLAND_PNG,
  CardAssets.ASSETS_DSK_279_ISLAND_PNG,
  CardAssets.ASSETS_DSK_279_ISLAND_PNG,
  CardAssets.ASSETS_DSK_279_ISLAND_PNG,
  CardAssets.ASSETS_DSK_281_SWAMP_PNG,
  CardAssets.ASSETS_DSK_281_SWAMP_PNG,
  CardAssets.ASSETS_DSK_281_SWAMP_PNG,
  CardAssets.ASSETS_DSK_281_SWAMP_PNG,
  CardAssets.ASSETS_MH3_243_BOGGART_BOG_JPG,
  CardAssets.ASSETS_DSC_265_BOJUKA_BOG_PNG,
  CardAssets.ASSETS_MKC_254_CHOKED_ESTUARY_PNG,
  CardAssets.ASSETS_DMU_245_CONTAMINATED_AQUIFER_PNG,
  CardAssets.ASSETS_CLB_888_CREEPING_TAR_PIT_PNG,
  CardAssets.ASSETS_OTC_282_DARKWATER_CATACOMBS_PNG,
  CardAssets.ASSETS_DSC_270_DIMIR_AQUEDUCT_PNG,
  CardAssets.ASSETS_RAV_277_DUSKMANTLE_HOUSE_OF_SHADOW_PNG,
  CardAssets.ASSETS_CMR_481_ENCROACHING_WASTES_PNG,
  CardAssets.ASSETS_OTC_296_FETID_POOLS_PNG,
  CardAssets.ASSETS_MOC_400_FIELD_OF_RUIN_PNG,
  CardAssets.ASSETS_CM2_253_GHOST_QUARTER_PNG,
  CardAssets.ASSETS_DSC_282_HALIMAR_DEPTHS_PNG,
  CardAssets.ASSETS_MH3_240_HYDROELECTRIC_LABORATORY_JPG,
  CardAssets.ASSETS_MH3_261_INUNDATED_ARCHIVE_JPG,
  CardAssets.ASSETS_ZNC_133_JWAR_ISLE_REFUGE_PNG,
  CardAssets.ASSETS_C20_288_MEMORIAL_TO_FOLLY_PNG,
  CardAssets.ASSETS_CLB_900_MORTUARY_MIRE_PNG,
  CardAssets.ASSETS_EMN_205_NEPHALIA_ACADEMY_PNG,
  CardAssets.ASSETS_LCC_344_NEPHALIA_DROWNYARD_PNG,
  CardAssets.ASSETS_DSC_295_RELIQUARY_TOWER_PNG,
  CardAssets.ASSETS_MKC_283_RIVER_OF_TEARS_PNG,
  CardAssets.ASSETS_OTC_313_ROGUE_S_PASSAGE_PNG,
  CardAssets.ASSETS_8ED_325_SALT_MARSH_PNG,
  CardAssets.ASSETS_OTC_316_SCAVENGER_GROUNDS_PNG,
  CardAssets.ASSETS_ZNC_141_SUBMERGED_BONEYARD_PNG,
  CardAssets.ASSETS_OTC_325_SUNKEN_HOLLOW_PNG,
  CardAssets.ASSETS_DSC_307_TEMPLE_OF_DECEIT_PNG,
  CardAssets.ASSETS_SNC_259_WATERFRONT_DISTRICT_PNG,
];

const clashCards = [
  CardAssets.ASSETS_LRW_100_BOG_HOODLUMS_PNG,
  CardAssets.ASSETS_LRW_77_PAPERFIN_RASCAL_PNG,
  CardAssets.ASSETS_LRW_81_RINGSKIPPER_PNG,
];

const rampCards = [
  CardAssets.ASSETS_DSC_92_ARCANE_SIGNET_PNG,
  CardAssets.ASSETS_CLB_305_CHARCOAL_DIAMOND_PNG,
  CardAssets.ASSETS_CLU_221_DIMIR_SIGNET_PNG,
  CardAssets.ASSETS_JMP_472_MANA_GEODE_PNG,
  CardAssets.ASSETS_DSC_248_MIND_STONE_PNG,
  CardAssets.ASSETS_CLB_337_SKY_DIAMOND_PNG,
  CardAssets.ASSETS_DSC_94_SOL_RING_PNG,
  CardAssets.ASSETS_MKC_242_TALISMAN_OF_DOMINANCE_PNG,
  CardAssets.ASSETS_DSC_256_THOUGHT_VESSEL_PNG,
  CardAssets.ASSETS_MH3_298_WORN_POWERSTONE_PNG,
];

const drawCards = [
  CardAssets.ASSETS_SNC_37_CASE_THE_JOINT_PNG,
  CardAssets.ASSETS_CLU_84_CONSIDER_PNG,
  CardAssets.ASSETS_C18_88_DREAM_CACHE_PNG,
  CardAssets.ASSETS_WHO_133_GREAT_INTELLIGENCE_S_PLAN_PNG,
  CardAssets.ASSETS_LRW_117_HOARDER_S_GREED_PNG,
  CardAssets.ASSETS_MH3_65_KOZILEK_S_UNSEALING_PNG,
  CardAssets.ASSETS_MOR_75_PULLING_TEETH_PNG,
  CardAssets.ASSETS_DSC_154_READ_THE_BONES_PNG,
  CardAssets.ASSETS_MOR_46_RESEARCH_THE_DEEP_PNG,
  CardAssets.ASSETS_2XM_72_THOUGHT_REFLECTION_PNG,
];

const reorganizeLibrary = [
  CardAssets.ASSETS_DMR_40_AVEN_FATESHAPER_PNG,
  CardAssets.ASSETS_DSC_242_BRAINSTONE_PNG,
  CardAssets.ASSETS_DSC_113_BRAINSTORM_PNG,
  CardAssets.ASSETS_MH3_53_BRAINSURGE_PNG,
  CardAssets.ASSETS_SOK_33_DESCENDANT_OF_SORAMARO_PNG,
  CardAssets.ASSETS_DSC_87_DIABOLIC_VISION_PNG,
  CardAssets.ASSETS_DTK_104_GRAVEPURGE_PNG,
  CardAssets.ASSETS_MOM_228_HIDETSUGU_AND_KAIRI_PNG,
  CardAssets.ASSETS_DMR_56_IMPULSE_PNG,
  CardAssets.ASSETS_M13_55_INDEX_PNG,
  CardAssets.ASSETS_DSC_73_PONDER_PNG,
  CardAssets.ASSETS_MOR_76_REVIVE_THE_FALLEN_PNG,
  CardAssets.ASSETS_ONS_115_SPY_NETWORK_PNG,
];

const bigBoys = [
  CardAssets.ASSETS_M3C_46_BENTHIC_ANOMALY_PNG,
  CardAssets.ASSETS_CMM_78_BRINELIN_THE_MOON_KRAKEN_PNG,
  CardAssets.ASSETS_IKO_221_GYRUDA_DOOM_OF_DEPTHS_PNG,
  CardAssets.ASSETS_CLB_850_NEMESIS_OF_REASON_PNG,
  CardAssets.ASSETS_VOW_246_RUNO_STROMKIRK_JPG,
  CardAssets.ASSETS_VOW_246_KROTHUSS_LORD_OF_THE_DEEP_JPG,
  CardAssets.ASSETS_CMR_405_SLINN_VODA_THE_RISING_DEEP_PNG,
  CardAssets.ASSETS_WHO_55_STAR_WHALE_PNG,
  CardAssets.ASSETS_CMR_407_STORMTIDE_LEVIATHAN_PNG,
  CardAssets.ASSETS_CMM_129_TROMOKRATIS_PNG,
  CardAssets.ASSETS_NCC_359_WREXIAL_THE_RISEN_DEEP_PNG,
];

const protectionAndRemoval = [
  CardAssets.ASSETS_LRW_54_BROKEN_AMBITIONS_PNG,
  CardAssets.ASSETS_LRW_55_CAPTIVATING_GLANCE_PNG,
  CardAssets.ASSETS_DSC_136_DECREE_OF_PAIN_PNG,
  CardAssets.ASSETS_10E_81_DISCOMBOBULATE_PNG,
  CardAssets.ASSETS_DSC_78_FEED_THE_SWARM_PNG,
  CardAssets.ASSETS_GTC_189_PSYCHIC_STRIKE_PNG,
  CardAssets.ASSETS_CMD_60_SCATTERING_STROKE_PNG,
  CardAssets.ASSETS_DDH_62_UNDERMINE_PNG,
  CardAssets.ASSETS_LRW_147_WEED_STRANGLE_PNG,
  CardAssets.ASSETS_CMR_409_WHELMING_WAVE_PNG,
  CardAssets.ASSETS_CMD_69_WHIRLPOOL_WHELM_JPG,
];

const topDeck = [
  CardAssets.ASSETS_VOW_50_CEMETERY_ILLUMINATOR_PNG,
  CardAssets.ASSETS_MH1_53_FUTURE_SIGHT_PNG,
  CardAssets.ASSETS_5DN_135_LANTERN_OF_INSIGHT_PNG,
  CardAssets.ASSETS_MAT_10_VESUVAN_DRIFTER_PNG,
  CardAssets.ASSETS_RAV_75_WIZENED_SNITCHES_PNG,
];

extension BuildContextExtensions on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      title: 'Marvo, Deep Operative',
      theme: theme.dark(),
      home: Stack(
        children: [
          const Positioned.fill(
            child: MyHomePage(),
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
      ),
    );
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollController = ScrollController();

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
          Text(
            'CLASH, SWITCH YOUR DECK AROUND AND PLAY BIG SEA MONSTERS!',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.tertiaryFixed,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          const Center(
            child: RotatingShiningCard(
              image: CardAssets.ASSETS_MKC_7_MARVO_DEEP_OPERATIVE_PNG,
              width: 400,
              height: 560,
            ),
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'MAIN STRATEGY',
            style: context.textTheme.headlineLarge?.copyWith(
              fontFamily: creepsterFont,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 72,
            ),
          ),
          Text(
            'Marvo is all about clashing and playing big cards for free.\nPlay your commander first, reorganize your top deck to always have high mana spells, and attack.\nWin your clashes against your opponents and cast big spells for free. Win with the power of monstruous sea creatures. Octopuses are in fact one of the smartest creatures on Earth!',
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
                for (final land in landCards) CardPreview(asset: land),
              ],
            ),
          ),
          spacing,
          Text(
            'Use lands such as Bojuka Bog, Encroaching Wastes, Field of Ruin, Ghost Quarter or Scavenger Grounds to protect yourself and delay your opponents\' games.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          Text(
            'Use lands such as Nephalia Drownyard, Nephalia Academy, Mortuary Mire, Halimar Depths or Duskmantle, House of Shadow to set up Marvo for a winning CLASH against your opponents.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          Text(
            'Don\'t forget MFC lands such as Boggart Bog, Inundated Archive and Hydroelectric Laboratory in case you need some extra defenses in your game.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'CLASH',
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
                for (final clash in clashCards) CardPreview(asset: clash),
              ],
            ),
          ),
          spacing,
          Text(
            'While there are more Clash cards in this deck, these do not have a particular purpose like protection or ramping.\nHowever, they are still important to add more clashing opportunities for Marvo.\nPlay Bog Hoodlums and Paperfin Rascal when your commander is already on the board.\nTry to ensure Ringskipper dies while Marvo is on the board.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'RAMP',
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
                for (final ramp in rampCards) CardPreview(asset: ramp),
              ],
            ),
          ),
          spacing,
          Text(
            'Ramp is pretty standard in this deck, mostly consisted of mana rocks.\nTry to play Mana Geode when Marvo is on the board so you can get a chance at improving your odds at winning a clash when Marvo attacks.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          spacing,
          spacing,
          MainSectionText(
            text: 'DRAW/DISCARD',
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
                for (final draw in drawCards) CardPreview(asset: draw),
              ],
            ),
          ),
          spacing,
          Text(
            'Most of your draw engine will have something attached that improves your chances at winning clashes with Marvo.\nCards like Case the Joint, Consider, Dream Cache, Hoarder\'s Greed, Read the Bones or Research the Deep will allow you to clash with your opponents or reorganize your top deck.\nCards like Great Intelligence\'s Plan or Pulling Teeth allow you to force your opponents to discard. Pulling Teeth or Consider can also be used for example with Mortuary Mire so you can ensure that your top deck has a big mana spell.\nWin a clash and play Thought Reflection for free and get an extra draw whenever you draw a card.\nRemember, the goal is for your top deck to always have high mana value cards, so you can play them for free with Marvo\'s ability.',
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
                for (final reorganize in reorganizeLibrary)
                  CardPreview(asset: reorganize),
              ],
            ),
          ),
          spacing,
          Text(
            'One of the key aspects of this deck is reorganizing your library, specifically your top deck. This is a crucial step to ensure you get the most out of Marvo, Deep Operative.\nThe logic behind these cards is the same as before: rearrange your top deck in order for you to win clashes.\nPlay ahead of time with cards like Index or Diabolic Vision, which allows you to rearrange the next 5 cards you will draw.\nUse Spy Network to know for sure that you will win a clash against an opponent.\nCast Gravepurge if an opponent plays a board wipe spell.\nDraw some cards you might not need for your clash with Brainstorm, Brainsurge or Ponder.',
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
                for (final bigBoy in bigBoys) CardPreview(asset: bigBoy),
              ],
            ),
          ),
          spacing,
          Text(
            'Showcase the strength of the deep seas with this collection of big boys.\nIdeally, you will never spend any mana to cast these, apart from maybe Runo Stromkirk. You should strive to cast these for free by leveraging Marvo\'s ability.\nPlay Star Whale to give protection to your other creatures.\nIs a player being annoying to you? Swing Nemesis of Reason at them to see if they change their mind!\nToo many blockers facing you? Play Stormtide Leviathan to stop anyone from attacking and blocking.',
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
                for (final protection in protectionAndRemoval)
                  CardPreview(asset: protection),
              ],
            ),
          ),
          spacing,
          Text(
            'Stop your opponents from ruining your game plan by countering their spells or destroying key fixtures of their decks.\nDid someone create a bunch of tokens? Throw a Whelming Wave or a Decree of Pain in their way.\nRemember to use clash counter spells or removal spells such as Broken Ambitions, Discombobulate, Scattering Strokem, Weed Strangle or Whirlpool Whelm only when you have Marvo in play.',
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
                for (final topDeckCard in topDeck)
                  CardPreview(asset: topDeckCard),
              ],
            ),
          ),
          spacing,
          Text(
            'Use these cards to see through the future.\nThese cards will allow you to even have more confidence in your clashing payoffs by allowing you to see at your top deck as well as other players\' top decks.',
            style: context.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
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
        ],
      ),
    );
  }
}

class CardPreview extends StatelessWidget {
  const CardPreview({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: 300,
      height: 380,
    );
  }
}

class MainSectionText extends StatelessWidget {
  const MainSectionText({
    super.key,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GradientAnimationText(
      text: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
      colors: [
        context.colorScheme.onPrimary,
        context.colorScheme.surface,
        context.colorScheme.primary,
        context.colorScheme.secondary,
      ],
      duration: const Duration(milliseconds: 3000),
      transform: const GradientRotation(pi / 4),
    );
  }
}
