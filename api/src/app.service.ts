import { Injectable } from '@nestjs/common';
import Surreal = require('surrealdb.js');

const db = new Surreal('http://127.0.0.1:8000/rpc');
@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }
  async getPeople() {
    await db.signin({
      user: 'root',
      pass: 'root',
    });
    await db.use('test', 'test');
    // eslint-disable-next-line prefer-const
    let humans = await db.select('human');
    return humans;
  }
}
