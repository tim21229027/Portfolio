export const getRandomInt = (max: number) => {
  return Math.floor(Math.random() * max);
};

export const generaRandomArray = (length: number, content: any) => {
  return Array.from({ length }, () => {
    return content;
  });
};
