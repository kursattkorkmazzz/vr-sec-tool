.class final Lcom/unity3d/player/N;
.super Lcom/unity3d/player/J;
.source "SourceFile"


# instance fields
.field private h:Z

.field private i:Landroid/os/Handler;

.field private j:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/unity3d/player/UnityPlayer;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/unity3d/player/J;-><init>(Landroid/content/Context;Lcom/unity3d/player/UnityPlayer;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/unity3d/player/N;->h:Z

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 1

    iput-boolean p1, p0, Lcom/unity3d/player/J;->d:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public final c()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/N;->i:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/unity3d/player/N;->j:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    iget-object v1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unity3d/player/N;->h:Z

    invoke-virtual {p0}, Lcom/unity3d/player/J;->invokeOnClose()V

    return-void
.end method

.method protected createEditText(Lcom/unity3d/player/J;)Landroid/widget/EditText;
    .locals 2

    new-instance v0, Lcom/unity3d/player/M;

    iget-object v1, p0, Lcom/unity3d/player/J;->a:Landroid/content/Context;

    invoke-direct {v0, p0, v1, p1}, Lcom/unity3d/player/M;-><init>(Lcom/unity3d/player/N;Landroid/content/Context;Lcom/unity3d/player/J;)V

    return-object v0
.end method

.method public final d()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final e()V
    .locals 4

    iget-boolean v0, p0, Lcom/unity3d/player/N;->h:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    iget-object v1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    iget-object v1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    iget-object v0, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    new-instance v0, Lcom/unity3d/player/L;

    invoke-direct {v0, p0}, Lcom/unity3d/player/L;-><init>(Lcom/unity3d/player/N;)V

    iput-object v0, p0, Lcom/unity3d/player/N;->j:Ljava/lang/Runnable;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/unity3d/player/N;->i:Landroid/os/Handler;

    iget-object v1, p0, Lcom/unity3d/player/N;->j:Ljava/lang/Runnable;

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unity3d/player/N;->h:Z

    return-void
.end method
