jQuery.fn.formHints = function (conf) {
    var config = jQuery.extend({
        formControls:    'input[title], textarea[title]',
        className:        'default-value'
    }, conf);

    return this.each(function () {
        jQuery(config.formControls, this).each(function () {
            var t = jQuery(this);

            t.formHint = t.attr('title');
            t.attr('title', '');

            if (t.val() === '' || t.val() == t.formHint) {
                t.addClass(config.className).val(t.formHint);
            }

            t.focus(function () {
                if (t.val() == t.formHint) {
                    t.val('').removeClass(config.className);
                }
            });

            t.blur(function () {
                if (t.val() === '' || t.val() == t.formHint) {
                    t.addClass(config.className).val(t.formHint);
                }
            });
        });

        // Remove hints on form submission
        jQuery('form', this).submit(function () {
            jQuery('.' + config.className, this).removeClass(config.className).val('');
        });
    });
};