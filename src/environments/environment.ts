// Helper function to safely get values from _NGX_ENV_
function getEnvValue(key: string, fallback = ''): string {
  if (typeof _NGX_ENV_ !== 'undefined' && _NGX_ENV_[key]) {
    return _NGX_ENV_[key];
  }
  return fallback;
}

export const environment = {
  NG_APP_ENV: getEnvValue('NG_APP_ENV') || 'development',
  NG_APP_API_URL: getEnvValue('NG_APP_API_URL') || '',
  NG_APP_FEATURE_FLAG: getEnvValue('NG_APP_FEATURE_FLAG') || 'false',
};
