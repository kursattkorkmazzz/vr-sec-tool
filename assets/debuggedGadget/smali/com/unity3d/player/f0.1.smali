.class final Lcom/unity3d/player/f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/unity3d/player/y;


# instance fields
.field final synthetic a:Lcom/unity3d/player/g0;


# direct methods
.method constructor <init>(Lcom/unity3d/player/g0;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/f0;->a:Lcom/unity3d/player/g0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    iget-object p0, p0, Lcom/unity3d/player/f0;->a:Lcom/unity3d/player/g0;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unity3d/player/g0;->a:Z

    iget-boolean v0, p0, Lcom/unity3d/player/g0;->b:Z

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/unity3d/player/g0;->c:Ljava/util/concurrent/Semaphore;

    invoke-virtual {p0}, Ljava/util/concurrent/Semaphore;->release()V

    :cond_0
    return-void
.end method
