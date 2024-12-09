.class final Lcom/unity3d/player/V0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/unity3d/player/UnityPlayer;

.field private b:Landroid/content/Context;

.field private c:Lcom/unity3d/player/U0;

.field private final d:Ljava/util/concurrent/Semaphore;

.field private final e:Ljava/util/concurrent/locks/ReentrantLock;

.field private f:Lcom/unity3d/player/N0;

.field private g:I

.field private h:Z

.field private i:Z


# direct methods
.method static bridge synthetic -$$Nest$fgeta(Lcom/unity3d/player/V0;)Lcom/unity3d/player/UnityPlayer;
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V0;->a:Lcom/unity3d/player/UnityPlayer;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetb(Lcom/unity3d/player/V0;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V0;->b:Landroid/content/Context;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetc(Lcom/unity3d/player/V0;)Lcom/unity3d/player/U0;
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V0;->c:Lcom/unity3d/player/U0;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetd(Lcom/unity3d/player/V0;)Ljava/util/concurrent/Semaphore;
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V0;->d:Ljava/util/concurrent/Semaphore;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgete(Lcom/unity3d/player/V0;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetf(Lcom/unity3d/player/V0;)Lcom/unity3d/player/N0;
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgeti(Lcom/unity3d/player/V0;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/unity3d/player/V0;->i:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputf(Lcom/unity3d/player/V0;Lcom/unity3d/player/N0;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputg(Lcom/unity3d/player/V0;I)V
    .locals 0

    iput p1, p0, Lcom/unity3d/player/V0;->g:I

    return-void
.end method

.method static bridge synthetic -$$Nest$fputi(Lcom/unity3d/player/V0;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unity3d/player/V0;->i:Z

    return-void
.end method

.method constructor <init>(Lcom/unity3d/player/UnityPlayer;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unity3d/player/V0;->a:Lcom/unity3d/player/UnityPlayer;

    iput-object v0, p0, Lcom/unity3d/player/V0;->b:Landroid/content/Context;

    new-instance v1, Ljava/util/concurrent/Semaphore;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v1, p0, Lcom/unity3d/player/V0;->d:Ljava/util/concurrent/Semaphore;

    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    iput-object v0, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    const/4 v0, 0x2

    iput v0, p0, Lcom/unity3d/player/V0;->g:I

    iput-boolean v2, p0, Lcom/unity3d/player/V0;->h:Z

    iput-boolean v2, p0, Lcom/unity3d/player/V0;->i:Z

    iput-object p1, p0, Lcom/unity3d/player/V0;->a:Lcom/unity3d/player/UnityPlayer;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    iget-object v0, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/unity3d/player/N0;->updateVideoLayout()V

    :cond_0
    iget-object p0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;IIIZJJLcom/unity3d/player/U0;)Z
    .locals 14

    move-object v11, p0

    iget-object v0, v11, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    move-object/from16 v0, p11

    iput-object v0, v11, Lcom/unity3d/player/V0;->c:Lcom/unity3d/player/U0;

    move-object v0, p1

    iput-object v0, v11, Lcom/unity3d/player/V0;->b:Landroid/content/Context;

    iget-object v0, v11, Lcom/unity3d/player/V0;->d:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->drainPermits()I

    const/4 v12, 0x2

    iput v12, v11, Lcom/unity3d/player/V0;->g:I

    new-instance v13, Lcom/unity3d/player/Q0;

    move-object v0, v13

    move-object v1, p0

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    invoke-direct/range {v0 .. v10}, Lcom/unity3d/player/Q0;-><init>(Lcom/unity3d/player/V0;Ljava/lang/String;IIIZJJ)V

    invoke-virtual {p0, v13}, Lcom/unity3d/player/V0;->runOnUiThread(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, v11, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    iget-object v1, v11, Lcom/unity3d/player/V0;->d:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    iget-object v1, v11, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    iget v1, v11, Lcom/unity3d/player/V0;->g:I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v1, v12, :cond_0

    const/4 v0, 0x1

    :catch_0
    :cond_0
    new-instance v1, Lcom/unity3d/player/R0;

    invoke-direct {v1, p0}, Lcom/unity3d/player/R0;-><init>(Lcom/unity3d/player/V0;)V

    invoke-virtual {p0, v1}, Lcom/unity3d/player/V0;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz v0, :cond_1

    iget v1, v11, Lcom/unity3d/player/V0;->g:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    new-instance v1, Lcom/unity3d/player/S0;

    invoke-direct {v1, p0}, Lcom/unity3d/player/S0;-><init>(Lcom/unity3d/player/V0;)V

    goto :goto_0

    :cond_1
    new-instance v1, Lcom/unity3d/player/T0;

    invoke-direct {v1, p0}, Lcom/unity3d/player/T0;-><init>(Lcom/unity3d/player/V0;)V

    :goto_0
    invoke-virtual {p0, v1}, Lcom/unity3d/player/V0;->runOnUiThread(Ljava/lang/Runnable;)V

    iget-object v1, v11, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v0
.end method

.method public final b()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    iget-object v0, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    if-eqz v0, :cond_1

    iget v1, p0, Lcom/unity3d/player/V0;->g:I

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/unity3d/player/N0;->cancelOnPrepare()V

    goto :goto_0

    :cond_0
    iget-boolean v1, p0, Lcom/unity3d/player/V0;->i:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/unity3d/player/N0;->a()Z

    move-result v0

    iput-boolean v0, p0, Lcom/unity3d/player/V0;->h:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    invoke-virtual {v0}, Lcom/unity3d/player/N0;->pause()V

    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method public final c()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    iget-object v0, p0, Lcom/unity3d/player/V0;->f:Lcom/unity3d/player/N0;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/unity3d/player/V0;->i:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/unity3d/player/V0;->h:Z

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/unity3d/player/N0;->start()V

    :cond_0
    iget-object p0, p0, Lcom/unity3d/player/V0;->e:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method

.method protected runOnUiThread(Ljava/lang/Runnable;)V
    .locals 1

    iget-object p0, p0, Lcom/unity3d/player/V0;->b:Landroid/content/Context;

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    const/4 p0, 0x5

    const-string p1, "Not running from an Activity; Ignoring execution request..."

    invoke-static {p0, p1}, Lcom/unity3d/player/u;->Log(ILjava/lang/String;)V

    :goto_0
    return-void
.end method
