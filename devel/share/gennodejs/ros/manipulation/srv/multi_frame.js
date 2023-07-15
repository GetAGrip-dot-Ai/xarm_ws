// Auto-generated. Do not edit!

// (in-package manipulation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class multi_frameRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.req_id = null;
    }
    else {
      if (initObj.hasOwnProperty('req_id')) {
        this.req_id = initObj.req_id
      }
      else {
        this.req_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type multi_frameRequest
    // Serialize message field [req_id]
    bufferOffset = _serializer.int16(obj.req_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type multi_frameRequest
    let len;
    let data = new multi_frameRequest(null);
    // Deserialize message field [req_id]
    data.req_id = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulation/multi_frameRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd67e2fcd47f3255cc3fbcfba8a121186';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 req_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new multi_frameRequest(null);
    if (msg.req_id !== undefined) {
      resolved.req_id = msg.req_id;
    }
    else {
      resolved.req_id = 0
    }

    return resolved;
    }
};

class multi_frameResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reply = null;
    }
    else {
      if (initObj.hasOwnProperty('reply')) {
        this.reply = initObj.reply
      }
      else {
        this.reply = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type multi_frameResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.int16(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type multi_frameResponse
    let len;
    let data = new multi_frameResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulation/multi_frameResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8649bbb6dd4aac4f3d4e2a496294c98f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 reply
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new multi_frameResponse(null);
    if (msg.reply !== undefined) {
      resolved.reply = msg.reply;
    }
    else {
      resolved.reply = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: multi_frameRequest,
  Response: multi_frameResponse,
  md5sum() { return '49ea530aae91150cd4645ab17a741cf0'; },
  datatype() { return 'manipulation/multi_frame'; }
};
