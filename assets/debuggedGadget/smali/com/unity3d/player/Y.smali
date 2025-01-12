.class final Lcom/unity3d/player/Y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field final synthetic a:Lcom/unity3d/player/Z;


# direct methods
.method constructor <init>(Lcom/unity3d/player/Z;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    iget-object p2, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-static {p2}, Lcom/unity3d/player/Z;->-$$Nest$fgetb(Lcom/unity3d/player/Z;)Lcom/unity3d/player/UnityPlayer;

    move-result-object p2

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p1}, Lcom/unity3d/player/UnityPlayer;->updateGLDisplay(ILandroid/view/Surface;)V

    iget-object p0, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-static {p0}, Lcom/unity3d/player/Z;->-$$Nest$fgetb(Lcom/unity3d/player/Z;)Lcom/unity3d/player/UnityPlayer;

    move-result-object p0

    invoke-virtual {p0}, Lcom/unity3d/player/UnityPlayer;->sendSurfaceChangedEvent()V

    return-void
.end method

.method public final surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-static {v0}, Lcom/unity3d/player/Z;->-$$Nest$fgetb(Lcom/unity3d/player/Z;)Lcom/unity3d/player/UnityPlayer;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/unity3d/player/UnityPlayer;->updateGLDisplay(ILandroid/view/Surface;)V

    iget-object p0, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-static {p0}, Lcom/unity3d/player/Z;->-$$Nest$fgetc(Lcom/unity3d/player/Z;)Lcom/unity3d/player/C;

    move-result-object p1

    invoke-static {p0}, Lcom/unity3d/player/Z;->-$$Nest$fgetb(Lcom/unity3d/player/Z;)Lcom/unity3d/player/UnityPlayer;

    move-result-object p0

    iget-object v0, p1, Lcom/unity3d/player/C;->b:Lcom/unity3d/player/B;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/unity3d/player/C;->b:Lcom/unity3d/player/B;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p1, Lcom/unity3d/player/C;->b:Lcom/unity3d/player/B;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public final surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3

    iget-object p1, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-static {p1}, Lcom/unity3d/player/Z;->-$$Nest$fgetc(Lcom/unity3d/player/Z;)Lcom/unity3d/player/C;

    move-result-object v0

    invoke-static {p1}, Lcom/unity3d/player/Z;->-$$Nest$fgeta(Lcom/unity3d/player/Z;)Lcom/unity3d/player/a;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-boolean v1, Lcom/unity3d/player/PlatformSupport;->NOUGAT_SUPPORT:Z

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/unity3d/player/C;->a:Landroid/content/Context;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/unity3d/player/C;->b:Lcom/unity3d/player/B;

    if-nez v1, :cond_0

    new-instance v1, Lcom/unity3d/player/B;

    iget-object v2, v0, Lcom/unity3d/player/C;->a:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/unity3d/player/B;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/unity3d/player/C;->b:Lcom/unity3d/player/B;

    :cond_0
    iget-object v0, v0, Lcom/unity3d/player/C;->b:Lcom/unity3d/player/B;

    invoke-virtual {v0, p1}, Lcom/unity3d/player/B;->a(Landroid/view/SurfaceView;)V

    :cond_1
    iget-object p0, p0, Lcom/unity3d/player/Y;->a:Lcom/unity3d/player/Z;

    invoke-static {p0}, Lcom/unity3d/player/Z;->-$$Nest$fgetb(Lcom/unity3d/player/Z;)Lcom/unity3d/player/UnityPlayer;

    move-result-object p0

    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/unity3d/player/UnityPlayer;->updateGLDisplay(ILandroid/view/Surface;)V

    return-void
.end method
