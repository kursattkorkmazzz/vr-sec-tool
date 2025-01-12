.class final Lcom/unity3d/player/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field final synthetic a:Lcom/unity3d/player/r;


# direct methods
.method constructor <init>(Lcom/unity3d/player/r;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/q;->a:Lcom/unity3d/player/r;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/q;->a:Lcom/unity3d/player/r;

    invoke-static {p0}, Lcom/unity3d/player/r;->-$$Nest$fgeta(Lcom/unity3d/player/r;)Lcom/unity3d/player/a/b;

    move-result-object p0

    check-cast p0, Lcom/unity3d/player/Camera2Wrapper;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/Camera2Wrapper;->a(Ljava/lang/Object;)V

    return-void
.end method
