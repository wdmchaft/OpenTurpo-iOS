//
//  ArduinoNetworkModel.h
//  OpenTurpo-iOS
//
//  Created by Tim Uusitalo on 1/17/12.
//  Copyright (c) 2012 OpenTurpoClub. All rights reserved.
//

#ifndef ARDUINO_NETWORK_MODEL_H
#define ARDUINO_NETWORK_MODEL_H

enum {
    SET = 'a',
    READ = 'b'
} Command;

enum {
    ALL =             'a',
    LAMBDA =          'b',
    FUEL_PUMP_RELAY = 'c',
    AMM =             'd',
    AMM_TEMP =        'e',
    ENGINE_TEMP =     'f',
    INJECTOR_RELAY =  'g',
    DME_RELAY =       'h',
    RPM =             'i',
    FUEL_CONSUMPTION = 'j',
    FAN_LO =          'k',
    FAN_HI =          'l'
} Device;

enum {
    ON =   'a',
    OFF =  'b'

} Operation;

typedef struct {
    int lambda;
    float amm;
    float amm_temp;
    float rpm;
    float engine_temp;
    float fuel_consumption;
} SensorData;


#endif


//
//enum{
//    SET  = 'a',
//    READ = 'b'
//}COMMAND;
//
//enum{
//    ALL =             'a',
//    LAMBDA =          'b',
//    FUEL_PUMP_RELAY = 'c',
//    AMM =             'd',
//    AMM_TEMP =        'e',
//    ENGINE_TEMP =     'f',
//    INJECTOR_RELAY =  'g',
//    DME_RELAY =       'h',
//    RPM =             'i',
//    FUEL_CONSUMPTION = 'j',
//    FAN_LO =          'k',
//    FAN_HI =          'l'
//}DEVICE;
//
//enum{
//    ON =   'a',
//    OFF =  'b'
//}OPERATION;
//
//typedef struct{
//    int lambda;
//    float amm;
//    float amm_temp;
//    float rpm;
//    float engine_temp;
//    float fuel_consumption;
//}full_sensor_data;
