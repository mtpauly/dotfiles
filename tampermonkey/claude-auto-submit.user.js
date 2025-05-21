// ==UserScript==
// @name         Claude Auto Submit
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Automatically submit queries that are pre-filled in Claude's interface
// @match        https://claude.ai/new*
// @grant        none
// @run-at       document-end
// ==/UserScript==

(function() {
    'use strict';

    // Only proceed if the URL contains a query parameter
    if (!window.location.href.includes('?q=')) {
        console.log("Claude Auto Submit: No query parameter found in URL");
        return;
    }

    console.log("Claude Auto Submit: Found query parameter in URL, waiting for button to appear");

    // Function to check if the element is not just in the DOM but also visible
    function isElementVisible(element) {
        return element &&
               element.offsetWidth > 0 &&
               element.offsetHeight > 0 &&
               getComputedStyle(element).visibility !== 'hidden';
    }

    // Use MutationObserver to wait for the submit button to appear
    const observer = new MutationObserver((mutations, obs) => {
        const submitButton = document.querySelector('button[aria-label="Send message"]');

        if (submitButton && isElementVisible(submitButton)) {
            console.log("Claude Auto Submit: Found submit button, clicking it");

            // Short delay to make sure the button is fully interactive
            setTimeout(() => {
                submitButton.click();

                // We can stop observing once we've clicked the button
                obs.disconnect();

                console.log("Claude Auto Submit: Submit button clicked");
            }, 100);
        }
    });

    // Start observing changes to the DOM
    observer.observe(document.body, {
        childList: true,
        subtree: true
    });

    // Safety timeout to prevent the observer from running forever
    // Only needed in case something goes wrong with element detection
    setTimeout(() => {
        observer.disconnect();
        console.log("Claude Auto Submit: Safety timeout reached, stopping observation");
    }, 10000); // 10 second maximum waiting time
})();
