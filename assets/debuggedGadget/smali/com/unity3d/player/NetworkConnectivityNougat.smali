.class public Lcom/unity3d/player/NetworkConnectivityNougat;
.super Lcom/unity3d/player/NetworkConnectivity;
.source "SourceFile"


# instance fields
.field private b:I

.field private final c:Landroid/net/ConnectivityManager$NetworkCallback;


# direct methods
.method static bridge synthetic -$$Nest$fputb(Lcom/unity3d/player/NetworkConnectivityNougat;I)V
    .locals 0

    iput p1, p0, Lcom/unity3d/player/NetworkConnectivityNougat;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/unity3d/player/NetworkConnectivity;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/unity3d/player/NetworkConnectivityNougat;->b:I

    new-instance p1, Lcom/unity3d/player/v;

    invoke-direct {p1, p0}, Lcom/unity3d/player/v;-><init>(Lcom/unity3d/player/NetworkConnectivityNougat;)V

    iput-object p1, p0, Lcom/unity3d/player/NetworkConnectivityNougat;->c:Landroid/net/ConnectivityManager$NetworkCallback;

    iget-object v0, p0, Lcom/unity3d/player/NetworkConnectivity;->a:Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0}, Lcom/unity3d/player/NetworkConnectivity;->b()I

    move-result v0

    iput v0, p0, Lcom/unity3d/player/NetworkConnectivityNougat;->b:I

    iget-object p0, p0, Lcom/unity3d/player/NetworkConnectivity;->a:Landroid/net/ConnectivityManager;

    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/NetworkConnectivity;->a:Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object p0, p0, Lcom/unity3d/player/NetworkConnectivityNougat;->c:Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v0, p0}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    return-void
.end method

.method public final b()I
    .locals 0

    iget p0, p0, Lcom/unity3d/player/NetworkConnectivityNougat;->b:I

    return p0
.end method
