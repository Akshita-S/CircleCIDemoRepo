import { LightningElement, track } from 'lwc';

export default class Controls extends LightningElement {
    @track factors = [0,2,3,4,5,6];
    @track dividors = [2,3,4,5,6,7];

    handleAdd() {
        this.dispatchEvent(new CustomEvent('add'));
    }

    handleSubtract() {
        this.dispatchEvent(new CustomEvent('subtract'));
    }

    handleMultiply(event) {
        const factor = event.target.dataset.factor;
        this.dispatchEvent(new CustomEvent('multiply', {
          detail: factor
        }));
    }

    handleDivision(event) {
        const factor = event.target.dataset.factor;
        this.dispatchEvent(new CustomEvent('divide', {
          detail: factor
        }));
    }

}