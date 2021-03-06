import * as functions from './functions';

import { config as globalConfig } from '../index.js';

export const noDisplay = 'display: none !important;';

export function removeElements(config = globalConfig) {
  Object.keys(config).forEach((key) => {
    if (!!config[key]) {
      const method = `remove${key.charAt(0).toUpperCase()}${key.slice(1)}`;

      try {
        functions[method]();
      } catch (e) {
        // function call failed
      }
    }
  });
}
