declare global {
    interface Window {
        setShow?: (value: boolean) => void;
        flutter_inappwebview?: {
            callHandler: (handlerName: string, data: string) => void;
        };
    }
}

export { };
