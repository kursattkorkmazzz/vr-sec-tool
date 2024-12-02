export default interface IAuthorizator {
  authorize(...param: any): boolean;
}
