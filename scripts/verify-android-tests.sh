#!/bin/bash
# This is to be used with a CI/CD setup to run Android (instrumented) tests.

############################################################
# Run                                                      #
############################################################
Run()
{
  if ! ./gradlew clean assembleDebug -PdisablePreDex --stacktrace;
  then
    exit 1
  fi

  # Android tests (SDK)
  if ! ./gradlew HRSensing:phonesGroupDebugAndroidTest -Pandroid.testoptions.manageddevices.emulator.gpu="swiftshader_indirect";
  then
    exit 1
  fi

  # Android tests (App)
  if ! ./gradlew Cue:phonesGroupDebugAndroidTest -Pandroid.testoptions.manageddevices.emulator.gpu="swiftshader_indirect";
  then
    exit 1
  fi
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
Run

