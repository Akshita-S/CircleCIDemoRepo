import { LightningElement } from 'lwc';

export default class Augmentor extends LightningElement {
    startCounter = 0;
    addToCounter = 0;

    handleStartChange(event) {
      this.startCounter = parseInt(event.target.value);
    }

    handleMaximizeCounter() {
      this.template.querySelector('c-numerator').maximizeCounter();
    }

    handleAddToCounterChange(event) {
      this.addToCounter = parseInt(event.target.value);
    }

    handleAddToCounter() {
      console.log('value in aug - '+this.addToCounter);
      if(this.addToCounter === undefined || this.addToCounter === '' || this.addToCounter === NaN){
        this.addToCounter =0;
      }
      this.template.querySelector('c-numerator').addToCounter(this.addToCounter);
    }
}