export default interface IDropper {
    dropWithWhiteList(whiteList:string[]): void;
    dropWithBlackList(blackList:string[]): void;    
};