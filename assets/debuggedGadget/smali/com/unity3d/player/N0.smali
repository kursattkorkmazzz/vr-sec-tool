.class public final Lcom/unity3d/player/N0;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/widget/MediaController$MediaPlayerControl;


# static fields
.field public static final synthetic z:I


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/view/SurfaceView;

.field private final c:Landroid/view/SurfaceHolder;

.field private final d:Ljava/lang/String;

.field private final e:I

.field private final f:I

.field private final g:Z

.field private final h:J

.field private final i:J

.field private final j:Lcom/unity3d/player/N0;

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Landroid/media/MediaPlayer;

.field private p:Landroid/widget/MediaController;

.field private q:Z

.field private r:Z

.field private s:I

.field private t:Z

.field private u:I

.field private v:Z

.field private w:Lcom/unity3d/player/L0;

.field private x:Lcom/unity3d/player/M0;

.field private volatile y:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIZJJLcom/unity3d/player/L0;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->q:Z

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->r:Z

    iput v0, p0, Lcom/unity3d/player/N0;->s:I

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->t:Z

    iput v0, p0, Lcom/unity3d/player/N0;->u:I

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->v:Z

    iput v0, p0, Lcom/unity3d/player/N0;->y:I

    iput-object p11, p0, Lcom/unity3d/player/N0;->w:Lcom/unity3d/player/L0;

    iput-object p1, p0, Lcom/unity3d/player/N0;->a:Landroid/content/Context;

    iput-object p0, p0, Lcom/unity3d/player/N0;->j:Lcom/unity3d/player/N0;

    new-instance p11, Landroid/view/SurfaceView;

    invoke-direct {p11, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object p11, p0, Lcom/unity3d/player/N0;->b:Landroid/view/SurfaceView;

    invoke-virtual {p11}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/player/N0;->c:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    invoke-virtual {p0, p3}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p0, p11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const-string p3, "window"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    iput-object p2, p0, Lcom/unity3d/player/N0;->d:Ljava/lang/String;

    iput p4, p0, Lcom/unity3d/player/N0;->e:I

    iput p5, p0, Lcom/unity3d/player/N0;->f:I

    iput-boolean p6, p0, Lcom/unity3d/player/N0;->g:Z

    iput-wide p7, p0, Lcom/unity3d/player/N0;->h:J

    iput-wide p9, p0, Lcom/unity3d/player/N0;->i:J

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    return-void
.end method

.method private a(I)V
    .locals 0

    iput p1, p0, Lcom/unity3d/player/N0;->y:I

    iget-object p1, p0, Lcom/unity3d/player/N0;->w:Lcom/unity3d/player/L0;

    if-eqz p1, :cond_0

    iget p0, p0, Lcom/unity3d/player/N0;->y:I

    check-cast p1, Lcom/unity3d/player/P0;

    invoke-virtual {p1, p0}, Lcom/unity3d/player/P0;->a(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method final a()Z
    .locals 0

    iget-boolean p0, p0, Lcom/unity3d/player/N0;->t:Z

    return p0
.end method

.method public canPause()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public canSeekBackward()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public canSeekForward()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public cancelOnPrepare()V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/unity3d/player/N0;->a(I)V

    return-void
.end method

.method protected destroyPlayer()V
    .locals 1

    iget-boolean v0, p0, Lcom/unity3d/player/N0;->t:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->pause()V

    :cond_0
    invoke-virtual {p0}, Lcom/unity3d/player/N0;->doCleanUp()V

    return-void
.end method

.method protected doCleanUp()V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/player/N0;->x:Lcom/unity3d/player/M0;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/unity3d/player/M0;->-$$Nest$fputb(Lcom/unity3d/player/M0;Z)V

    iput-object v1, p0, Lcom/unity3d/player/N0;->x:Lcom/unity3d/player/M0;

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    iput-object v1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    :cond_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/unity3d/player/N0;->m:I

    iput v0, p0, Lcom/unity3d/player/N0;->n:I

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->r:Z

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->q:Z

    return-void
.end method

.method public exitOnKeypress(ILandroid/view/KeyEvent;)Z
    .locals 2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    iget v0, p0, Lcom/unity3d/player/N0;->e:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isSystem()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/unity3d/player/N0;->destroyPlayer()V

    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/unity3d/player/N0;->a(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public getAudioSessionId()I
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result p0

    :goto_0
    return p0
.end method

.method public getBufferPercentage()I
    .locals 1

    iget-boolean v0, p0, Lcom/unity3d/player/N0;->g:Z

    if-eqz v0, :cond_0

    iget p0, p0, Lcom/unity3d/player/N0;->s:I

    goto :goto_0

    :cond_0
    const/16 p0, 0x64

    :goto_0
    return p0
.end method

.method public getCurrentPosition()I
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result p0

    return p0
.end method

.method public getDuration()I
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result p0

    return p0
.end method

.method public isPlaying()Z
    .locals 3

    iget-boolean v0, p0, Lcom/unity3d/player/N0;->r:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/unity3d/player/N0;->q:Z

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object p0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez p0, :cond_1

    xor-int/lit8 p0, v0, 0x1

    return p0

    :cond_1
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result p0

    if-nez p0, :cond_2

    if-nez v0, :cond_3

    :cond_2
    move v1, v2

    :cond_3
    return v1
.end method

.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 0

    iput p2, p0, Lcom/unity3d/player/N0;->s:I

    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->destroyPlayer()V

    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/unity3d/player/N0;->a(I)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/unity3d/player/N0;->exitOnKeypress(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    goto :goto_0

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    :goto_0
    return p0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/unity3d/player/N0;->exitOnKeypress(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Landroid/view/View;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0

    goto :goto_0

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p0

    :goto_0
    return p0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    iget-object p1, p0, Lcom/unity3d/player/N0;->x:Lcom/unity3d/player/M0;

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-static {p1, v0}, Lcom/unity3d/player/M0;->-$$Nest$fputb(Lcom/unity3d/player/M0;Z)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/unity3d/player/N0;->x:Lcom/unity3d/player/M0;

    :cond_0
    iget p1, p0, Lcom/unity3d/player/N0;->e:I

    if-eqz p1, :cond_1

    if-ne p1, v0, :cond_3

    :cond_1
    new-instance p1, Landroid/widget/MediaController;

    iget-object v1, p0, Lcom/unity3d/player/N0;->a:Landroid/content/Context;

    invoke-direct {p1, v1}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    invoke-virtual {p1, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    iget-object p1, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    invoke-virtual {p1, p0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    invoke-virtual {p1, v0}, Landroid/widget/MediaController;->setEnabled(Z)V

    iget-object p1, p0, Lcom/unity3d/player/N0;->a:Landroid/content/Context;

    instance-of v1, p1, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast p1, Landroid/app/Activity;

    iget-object v1, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/MediaController;->setSystemUiVisibility(I)V

    :cond_2
    iget-object p1, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    invoke-virtual {p1}, Landroid/widget/MediaController;->show()V

    :cond_3
    iput-boolean v0, p0, Lcom/unity3d/player/N0;->r:Z

    iget-boolean p1, p0, Lcom/unity3d/player/N0;->q:Z

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    invoke-direct {p0, v0}, Lcom/unity3d/player/N0;->a(I)V

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->updateVideoLayout()V

    iget-boolean p1, p0, Lcom/unity3d/player/N0;->t:Z

    if-nez p1, :cond_5

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->start()V

    :cond_5
    :goto_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    iget v1, p0, Lcom/unity3d/player/N0;->e:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->destroyPlayer()V

    const/4 p1, 0x3

    invoke-direct {p0, p1}, Lcom/unity3d/player/N0;->a(I)V

    const/4 p0, 0x1

    return p0

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/N0;->p:Landroid/widget/MediaController;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Landroid/widget/MediaController;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    goto :goto_0

    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    :goto_0
    return p0
.end method

.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 0

    if-eqz p2, :cond_2

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/unity3d/player/N0;->q:Z

    iput p2, p0, Lcom/unity3d/player/N0;->m:I

    iput p3, p0, Lcom/unity3d/player/N0;->n:I

    iget-boolean p2, p0, Lcom/unity3d/player/N0;->r:Z

    if-eqz p2, :cond_2

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->isPlaying()Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lcom/unity3d/player/N0;->a(I)V

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->updateVideoLayout()V

    iget-boolean p1, p0, Lcom/unity3d/player/N0;->t:Z

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->start()V

    :cond_2
    :goto_0
    return-void
.end method

.method public pause()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v1, p0, Lcom/unity3d/player/N0;->v:Z

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/unity3d/player/N0;->u:I

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unity3d/player/N0;->t:Z

    return-void
.end method

.method public seekTo(I)V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    return-void
.end method

.method public start()V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v1, p0, Lcom/unity3d/player/N0;->v:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/unity3d/player/N0;->u:I

    if-lez v1, :cond_1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    :cond_1
    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    iput v2, p0, Lcom/unity3d/player/N0;->u:I

    :cond_2
    iput-boolean v2, p0, Lcom/unity3d/player/N0;->t:Z

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    iget p1, p0, Lcom/unity3d/player/N0;->k:I

    if-ne p1, p3, :cond_0

    iget p1, p0, Lcom/unity3d/player/N0;->l:I

    if-eq p1, p4, :cond_1

    :cond_0
    iput p3, p0, Lcom/unity3d/player/N0;->k:I

    iput p4, p0, Lcom/unity3d/player/N0;->l:I

    iget-boolean p1, p0, Lcom/unity3d/player/N0;->v:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->updateVideoLayout()V

    :cond_1
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 8

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/unity3d/player/N0;->v:Z

    iget-boolean v0, p0, Lcom/unity3d/player/N0;->t:Z

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_5

    iget v0, p0, Lcom/unity3d/player/N0;->u:I

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/unity3d/player/N0;->c:Landroid/view/SurfaceHolder;

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    iget-object p1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    iget p0, p0, Lcom/unity3d/player/N0;->u:I

    invoke-virtual {p1, p0}, Landroid/media/MediaPlayer;->seekTo(I)V

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/unity3d/player/N0;->c:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    iget-boolean p1, p0, Lcom/unity3d/player/N0;->t:Z

    if-nez p1, :cond_5

    iget p1, p0, Lcom/unity3d/player/N0;->u:I

    if-lez p1, :cond_1

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    :cond_1
    iget-object p1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    iput v1, p0, Lcom/unity3d/player/N0;->u:I

    goto/16 :goto_2

    :cond_2
    invoke-direct {p0, v1}, Lcom/unity3d/player/N0;->a(I)V

    invoke-virtual {p0}, Lcom/unity3d/player/N0;->doCleanUp()V

    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    iget-boolean v1, p0, Lcom/unity3d/player/N0;->g:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/unity3d/player/N0;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/unity3d/player/N0;->d:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    goto :goto_1

    :cond_3
    iget-wide v0, p0, Lcom/unity3d/player/N0;->i:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4

    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/unity3d/player/N0;->d:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    iget-wide v4, p0, Lcom/unity3d/player/N0;->h:J

    iget-wide v6, p0, Lcom/unity3d/player/N0;->i:J

    invoke-virtual/range {v2 .. v7}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v1, p0, Lcom/unity3d/player/N0;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v3

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v5

    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_0
    :try_start_2
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/unity3d/player/N0;->d:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    :goto_0
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    :goto_1
    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/unity3d/player/N0;->c:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    new-instance v1, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    invoke-virtual {v1, p1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p1

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setAudioAttributes(Landroid/media/AudioAttributes;)V

    iget-object p1, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V

    new-instance p1, Lcom/unity3d/player/M0;

    invoke-direct {p1, p0}, Lcom/unity3d/player/M0;-><init>(Lcom/unity3d/player/N0;)V

    iput-object p1, p0, Lcom/unity3d/player/N0;->x:Lcom/unity3d/player/M0;

    new-instance p1, Ljava/lang/Thread;

    iget-object v0, p0, Lcom/unity3d/player/N0;->x:Lcom/unity3d/player/M0;

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lcom/unity3d/player/N0;->a(I)V

    :cond_5
    :goto_2
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/unity3d/player/N0;->v:Z

    return-void
.end method

.method protected updateVideoLayout()V
    .locals 10

    iget-object v0, p0, Lcom/unity3d/player/N0;->o:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/N0;->a:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lez v0, :cond_1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-lez v1, :cond_1

    iput v0, p0, Lcom/unity3d/player/N0;->k:I

    iput v1, p0, Lcom/unity3d/player/N0;->l:I

    :cond_1
    iget v0, p0, Lcom/unity3d/player/N0;->k:I

    iget v1, p0, Lcom/unity3d/player/N0;->l:I

    iget-boolean v2, p0, Lcom/unity3d/player/N0;->q:Z

    if-eqz v2, :cond_5

    iget v2, p0, Lcom/unity3d/player/N0;->m:I

    int-to-float v3, v2

    iget v4, p0, Lcom/unity3d/player/N0;->n:I

    int-to-float v5, v4

    div-float/2addr v3, v5

    int-to-float v5, v0

    int-to-float v6, v1

    div-float v7, v5, v6

    iget v8, p0, Lcom/unity3d/player/N0;->f:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    cmpg-float v2, v7, v3

    if-gtz v2, :cond_3

    goto :goto_0

    :cond_2
    const/4 v9, 0x2

    if-ne v8, v9, :cond_4

    cmpl-float v2, v7, v3

    if-ltz v2, :cond_3

    :goto_0
    div-float/2addr v5, v3

    float-to-int v4, v5

    move v2, v0

    goto :goto_2

    :cond_3
    mul-float/2addr v6, v3

    float-to-int v2, v6

    goto :goto_1

    :cond_4
    if-nez v8, :cond_5

    goto :goto_2

    :cond_5
    move v2, v0

    :goto_1
    move v4, v1

    :goto_2
    if-ne v0, v2, :cond_6

    if-eq v1, v4, :cond_7

    :cond_6
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    invoke-direct {v0, v2, v4, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v1, p0, Lcom/unity3d/player/N0;->j:Lcom/unity3d/player/N0;

    iget-object p0, p0, Lcom/unity3d/player/N0;->b:Landroid/view/SurfaceView;

    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7
    return-void
.end method
