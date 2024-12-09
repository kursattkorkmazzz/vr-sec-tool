.class final Lcom/unity3d/player/T;
.super Lcom/unity3d/player/J;
.source "SourceFile"


# instance fields
.field h:Lcom/unity3d/player/K;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/unity3d/player/UnityPlayer;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/unity3d/player/J;-><init>(Landroid/content/Context;Lcom/unity3d/player/UnityPlayer;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;IZZZZLjava/lang/String;IZZ)V
    .locals 3

    new-instance v0, Lcom/unity3d/player/K;

    iget-object v1, p0, Lcom/unity3d/player/J;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    invoke-direct {v0, v1, v2}, Lcom/unity3d/player/K;-><init>(Landroid/content/Context;Lcom/unity3d/player/UnityPlayer;)V

    iput-object v0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    invoke-virtual {v0, p0, p9, p10}, Lcom/unity3d/player/K;->a(Lcom/unity3d/player/J;ZZ)V

    iget-object v0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    new-instance v1, Lcom/unity3d/player/O;

    invoke-direct {v1, p0}, Lcom/unity3d/player/O;-><init>(Lcom/unity3d/player/T;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-super/range {p0 .. p10}, Lcom/unity3d/player/J;->a(Ljava/lang/String;IZZZZLjava/lang/String;IZZ)V

    iget-object p1, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance p2, Lcom/unity3d/player/P;

    invoke-direct {p2, p0}, Lcom/unity3d/player/P;-><init>(Lcom/unity3d/player/T;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object p1, p0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    iget-object p1, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    new-instance p2, Lcom/unity3d/player/Q;

    invoke-direct {p2, p0}, Lcom/unity3d/player/Q;-><init>(Lcom/unity3d/player/T;)V

    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-void
.end method

.method public final a(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/unity3d/player/J;->d:Z

    iget-object p0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    invoke-virtual {p0, p1}, Lcom/unity3d/player/K;->a(Z)V

    return-void
.end method

.method public final c()V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method protected createEditText(Lcom/unity3d/player/J;)Landroid/widget/EditText;
    .locals 1

    new-instance v0, Lcom/unity3d/player/S;

    iget-object p0, p0, Lcom/unity3d/player/J;->a:Landroid/content/Context;

    invoke-direct {v0, p0, p1}, Lcom/unity3d/player/S;-><init>(Landroid/content/Context;Lcom/unity3d/player/J;)V

    return-object v0
.end method

.method public final e()V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method protected reportSoftInputArea()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unity3d/player/T;->h:Lcom/unity3d/player/K;

    invoke-virtual {v0}, Lcom/unity3d/player/K;->a()Landroid/graphics/Rect;

    move-result-object v0

    iget-object p0, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {p0, v0}, Lcom/unity3d/player/UnityPlayer;->reportSoftInputArea(Landroid/graphics/Rect;)V

    :cond_0
    return-void
.end method
