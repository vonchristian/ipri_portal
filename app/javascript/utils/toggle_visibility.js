
export function toggleTargetsByValue(selectedValue, target, showValue) {
  const shouldShow = Array.isArray(showValue)
    ? showValue.includes(selectedValue)
    : selectedValue === showValue;

  target.classList.toggle("hidden", !shouldShow);
}