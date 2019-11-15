import $ from 'jquery';
import select2 from 'select2';
import 'select2/dist/css/select2.min.css';

const initSelect2 = () => {
  $('.ingredient-select').select2();
  $('.cocktail-select').select2();
}

export { initSelect2 };
