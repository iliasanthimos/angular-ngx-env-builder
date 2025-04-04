import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {environment} from '../environments/environment';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = environment.NG_APP_ENV;

  constructor() {
    this.logEnvironmentVariables();
  }

  logEnvironmentVariables() {
    console.log('Environment Variables:');
    console.log('NG_APP_ENV:', environment.NG_APP_ENV);
    console.log('NG_APP_API_URL:', environment.NG_APP_API_URL);
    console.log('NG_APP_FEATURE_FLAG:', environment.NG_APP_FEATURE_FLAG);
  }
}
