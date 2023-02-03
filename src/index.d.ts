export type Callback = (result: string) => void
export interface Generator {
  (length: number): string,  
  (length: number, callback: Callback): void
}
export declare const gen_for: (alphabet: string) => Generator
export declare const hex: Generator
export declare const url: Generator
export declare const small: 11
export declare const medium: 22
export declare const large: 44
