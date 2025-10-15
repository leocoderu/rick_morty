/// Import Flutter
import 'package:flutter/material.dart';

/// Import Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_switch/triple_switch.dart';

/// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:design_layer/design_layer.dart';
import 'package:model_layer/model_layer.dart';

/// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Import Widgets
import 'widgets/switch_tile.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool sw = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, DefaultTheme>(
      builder: (BuildContext ctx, DefaultTheme state) {
        return Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings_title)),
          body: BlocBuilder<AppBloc, AppState>(
              builder: (BuildContext appCtx, AppState appState) {
                return Center(
                  child: ListView(
                    children: [
                      SwitchTile(
                        icon: Icons.sunny,
                        title: AppLocalizations.of(context)!.settings_swSystemTheme_title,
                        subtitle: AppLocalizations.of(context)!.settings_swSystemTheme_subtitle,
                        child: Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: locator.get<ThemeController>().get() == ThemeMode.system,
                          onChanged: (value) {
                            (value)
                                ? ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.system))
                                : ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.light));
                          },
                        ),
                      ),
                      SwitchTile(
                        enabled: locator.get<ThemeController>().get() != ThemeMode.system,
                        icon: Icons.dark_mode,
                        title: AppLocalizations.of(context)!.settings_swDarkTheme_title,
                        subtitle: AppLocalizations.of(context)!.settings_swDarkTheme_subtitle,
                        child: Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: locator.get<ThemeController>().get() == ThemeMode.dark,
                          onChanged: locator.get<ThemeController>().get() == ThemeMode.system ? null
                              : (value) {
                            (value)
                                ? ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.dark))
                                : ctx.read<ThemeBloc>().add(ChangeEvent(themeMode: ThemeMode.light));
                          },
                        ),
                      ),
                      Divider(),
                      SwitchTile(
                        icon: Icons.security,
                        title: AppLocalizations.of(context)!.settings_swAuthLocal_title,
                        subtitle: AppLocalizations.of(context)!.settings_swAuthLocal_subtitle,
                        child: Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: appState.authLocal ?? false,
                          onChanged: (value) => ctx.read<AppBloc>().add(ChangeAuthLocal(value: value)),
                        ),
                      ),
                      SwitchTile(
                        icon: Icons.lock_open,
                        title: AppLocalizations.of(context)!.settings_swAutoLogin_title,
                        subtitle: AppLocalizations.of(context)!.settings_swAutoLogin_subtitle,
                        child: Switch.adaptive(
                          applyCupertinoTheme: false,
                          value: appState.autoLogin ?? false,
                          onChanged: (value) => ctx.read<AppBloc>().add(ChangeAutoLogin(value: value)),
                        ),
                      ),

                      SwitchTile(
                        icon: Icons.recycling,
                        title: AppLocalizations.of(context)!.settings_swSecurity_title,
                        subtitle: AppLocalizations.of(context)!.settings_swSecurity_subtitle,
                        child: TripleSwitch(
                          id: 'switchSecurity',
                          //enabled: false,
                          timeoutOffOn: 60,
                          timeoutOnOff: 15,
                          functionOffOn: locator.get<FunctionController>().hFunc1,
                          functionOnOff: locator.get<FunctionController>().hFunc3,
                          argumentsOffOn: [923000000],
                          argumentsOnOff: [12, 12],
                          on: Text(AppLocalizations.of(context)!.settings_swON, style: textStyleEnabled),
                          off: Text(AppLocalizations.of(context)!.settings_swOFF, style: textStyleDisabled),
                          disabled: Text('DIS'),
                          animateDuration: 200,
                          sizeTrack: const Size(60, 42),
                          sizeSlider: const Size(40, 40),
                          decorationTrackOn: decorationTrackOn,
                          decorationTrackOff: decorationTrackOff,
                          decorationTrackWait: decorationTrackWait,
                          decorationTrackDisabled: decorationTrackDisabled,
                          decorationSliderOn: decorationSliderOn,
                          decorationSliderOff: decorationSliderOff,
                          decorationSliderWait: decorationSliderWait,
                          decorationSliderDisabled: decorationSliderDisabled,
                          timerStyle: textStyleEnabled,
                        ),
                      ),

                      // SwitchTile(
                      //   icon: Icons.recycling,
                      //   title: AppLocalizations.of(context)!.settings_swSecurity_title,
                      //   subtitle: AppLocalizations.of(context)!.settings_swSecurity_subtitle,
                      //   child:
                        TripleSwitch(
                          //enabled: true,
                          value: sw,
                          onChanged: (value) => setState(() => sw = value),
                          //sizeTrack: Size(60, 32),
                          //sizeSlider: Size(40, 30),
                          // decorationTrackOn: decorationTrackOn,
                          // decorationTrackOff: decorationTrackOff,
                          // decorationSliderOn: decorationSliderOn,
                          // decorationSliderOff: decorationSliderOff,
                          //on: Padding(padding: EdgeInsets.all(10), child: CircularProgressIndicator(),)
                        ),
                      //),
                    ],
                  ),
                );
              },
          ),
        );
      },
    );
  }
}
