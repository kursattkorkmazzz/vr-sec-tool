.class final Lcom/unity3d/player/P0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/unity3d/player/L0;


# instance fields
.field final synthetic a:Lcom/unity3d/player/Q0;


# direct methods
.method constructor <init>(Lcom/unity3d/player/Q0;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/P0;->a:Lcom/unity3d/player/Q0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/P0;->a:Lcom/unity3d/player/Q0;

    iget-object v0, v0, Lcom/unity3d/player/Q0;->h:Lcom/unity3d/player/V0;

    invoke-static {v0}, Lcom/unity3d/player/V0;->-$$Nest$fgete(Lcom/unity3d/player/V0;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    iget-object v0, p0, Lcom/unity3d/player/P0;->a:Lcom/unity3d/player/Q0;

    iget-object v0, v0, Lcom/unity3d/player/Q0;->h:Lcom/unity3d/player/V0;

    invoke-static {v0, p1}, Lcom/unity3d/player/V0;->-$$Nest$fputg(Lcom/unity3d/player/V0;I)V

    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    invoke-static {v0}, Lcom/unity3d/player/V0;->-$$Nest$fgeti(Lcom/unity3d/player/V0;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/unity3d/player/O0;

    invoke-direct {v1, p0}, Lcom/unity3d/player/O0;-><init>(Lcom/unity3d/player/P0;)V

    invoke-virtual {v0, v1}, Lcom/unity3d/player/V0;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/unity3d/player/P0;->a:Lcom/unity3d/player/Q0;

    iget-object p1, p1, Lcom/unity3d/player/Q0;->h:Lcom/unity3d/player/V0;

    invoke-static {p1}, Lcom/unity3d/player/V0;->-$$Nest$fgetd(Lcom/unity3d/player/V0;)Ljava/util/concurrent/Semaphore;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/Semaphore;->release()V

    :cond_1
    iget-object p0, p0, Lcom/unity3d/player/P0;->a:Lcom/unity3d/player/Q0;

    iget-object p0, p0, Lcom/unity3d/player/Q0;->h:Lcom/unity3d/player/V0;

    invoke-static {p0}, Lcom/unity3d/player/V0;->-$$Nest$fgete(Lcom/unity3d/player/V0;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method
