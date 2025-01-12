.class Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;


# instance fields
.field private a:Lcom/unity3d/player/i;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    sget-object v0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->b:Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    if-nez v0, :cond_1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-string v1, "com.google.android.play.core.assetpacks.AssetPackManager"

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getPackStates"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/util/List;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.android.gms.tasks.Task"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a(Landroid/content/Context;)Lcom/unity3d/player/i;

    move-result-object p1

    iput-object p1, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void

    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "PlayAssetDeliveryUnityWrapper should be created only once. Use getInstance() instead."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static a(Landroid/content/Context;)Lcom/unity3d/player/i;
    .locals 0

    invoke-static {p0}, Lcom/unity3d/player/i;->a(Landroid/content/Context;)Lcom/unity3d/player/i;

    move-result-object p0

    return-object p0
.end method

.method private a()V
    .locals 1

    invoke-virtual {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->playCoreApiMissing()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "AssetPackManager API is not available! Make sure your gradle project includes \'com.google.android.play:asset-delivery\' dependency."

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized getInstance()Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    .locals 4

    const-class v0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    monitor-enter v0

    :goto_0
    :try_start_0
    sget-object v1, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->b:Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    :try_start_1
    const-class v1, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v2, v1}, Lcom/unity3d/player/u;->Log(ILjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    monitor-exit v0

    return-object v1

    :cond_1
    :try_start_3
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "PlayAssetDeliveryUnityWrapper is not yet initialised."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized init(Landroid/content/Context;)Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    .locals 2

    const-class v0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->b:Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    if-nez v1, :cond_0

    new-instance v1, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    invoke-direct {v1, p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->b:Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    const-class p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    sget-object p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->b:Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v1, "PlayAssetDeliveryUnityWrapper.init() should be called only once. Use getInstance() instead."

    invoke-direct {p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public cancelAssetPackDownload(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->cancelAssetPackDownloads([Ljava/lang/String;)V

    return-void
.end method

.method public cancelAssetPackDownloads([Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/i;->a([Ljava/lang/String;)V

    return-void
.end method

.method public downloadAssetPack(Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->downloadAssetPacks([Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;)V

    return-void
.end method

.method public downloadAssetPacks([Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;)V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1, p2}, Lcom/unity3d/player/i;->a([Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;)V

    return-void
.end method

.method public getAssetPackPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/i;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getAssetPackState(Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->getAssetPackStates([Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;)V

    return-void
.end method

.method public getAssetPackStates([Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;)V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1, p2}, Lcom/unity3d/player/i;->a([Ljava/lang/String;Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;)V

    return-void
.end method

.method public playCoreApiMissing()Z
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public registerDownloadStatusListener(Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;)Ljava/lang/Object;
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/i;->a(Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public removeAssetPack(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/i;->b(Ljava/lang/String;)V

    return-void
.end method

.method public requestToUseMobileData(Landroid/app/Activity;Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;)V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1, p2}, Lcom/unity3d/player/i;->a(Landroid/app/Activity;Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;)V

    return-void
.end method

.method public unregisterDownloadStatusListener(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a()V

    iget-object p0, p0, Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;->a:Lcom/unity3d/player/i;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/i;->a(Ljava/lang/Object;)V

    return-void
.end method
