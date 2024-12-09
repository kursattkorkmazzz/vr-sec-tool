.class final Lcom/unity3d/player/A;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Lcom/unity3d/player/IPermissionRequestCallbacks;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Z


# direct methods
.method constructor <init>(Lcom/unity3d/player/IPermissionRequestCallbacks;Ljava/lang/String;IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/unity3d/player/A;->a:Lcom/unity3d/player/IPermissionRequestCallbacks;

    iput-object p2, p0, Lcom/unity3d/player/A;->b:Ljava/lang/String;

    iput p3, p0, Lcom/unity3d/player/A;->c:I

    iput-boolean p4, p0, Lcom/unity3d/player/A;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Lcom/unity3d/player/A;->c:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/unity3d/player/A;->d:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/A;->a:Lcom/unity3d/player/IPermissionRequestCallbacks;

    iget-object p0, p0, Lcom/unity3d/player/A;->b:Ljava/lang/String;

    invoke-interface {v0, p0}, Lcom/unity3d/player/IPermissionRequestCallbacks;->onPermissionDeniedAndDontAskAgain(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/unity3d/player/A;->a:Lcom/unity3d/player/IPermissionRequestCallbacks;

    iget-object p0, p0, Lcom/unity3d/player/A;->b:Ljava/lang/String;

    invoke-interface {v0, p0}, Lcom/unity3d/player/IPermissionRequestCallbacks;->onPermissionDenied(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/unity3d/player/A;->a:Lcom/unity3d/player/IPermissionRequestCallbacks;

    iget-object p0, p0, Lcom/unity3d/player/A;->b:Ljava/lang/String;

    invoke-interface {v0, p0}, Lcom/unity3d/player/IPermissionRequestCallbacks;->onPermissionGranted(Ljava/lang/String;)V

    :cond_3
    :goto_1
    return-void
.end method
