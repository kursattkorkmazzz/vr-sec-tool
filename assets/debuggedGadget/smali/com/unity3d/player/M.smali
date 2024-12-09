.class final Lcom/unity3d/player/M;
.super Landroid/widget/EditText;
.source "SourceFile"


# instance fields
.field final synthetic a:Lcom/unity3d/player/J;

.field final synthetic b:Lcom/unity3d/player/N;


# direct methods
.method constructor <init>(Lcom/unity3d/player/N;Landroid/content/Context;Lcom/unity3d/player/J;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/M;->b:Lcom/unity3d/player/N;

    iput-object p3, p0, Lcom/unity3d/player/M;->a:Lcom/unity3d/player/J;

    invoke-direct {p0, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final onEditorAction(I)V
    .locals 1

    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    iget-object p0, p0, Lcom/unity3d/player/M;->a:Lcom/unity3d/player/J;

    const/4 p1, 0x0

    invoke-virtual {p0}, Lcom/unity3d/player/J;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/unity3d/player/J;->a(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public final onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 3

    const/4 v0, 0x4

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    iget-object p0, p0, Lcom/unity3d/player/M;->b:Lcom/unity3d/player/N;

    invoke-virtual {p0}, Lcom/unity3d/player/J;->b()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lcom/unity3d/player/J;->a(Ljava/lang/String;Z)V

    return v1

    :cond_0
    const/16 v0, 0x54

    if-ne p1, v0, :cond_1

    return v1

    :cond_1
    const/16 v0, 0x42

    if-ne p1, v0, :cond_2

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/high16 v2, 0x20000

    and-int/2addr v0, v2

    if-nez v0, :cond_2

    iget-object p0, p0, Lcom/unity3d/player/M;->a:Lcom/unity3d/player/J;

    const/4 p1, 0x0

    invoke-virtual {p0}, Lcom/unity3d/player/J;->b()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2, p1}, Lcom/unity3d/player/J;->a(Ljava/lang/String;Z)V

    return v1

    :cond_2
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method protected onSelectionChanged(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onSelectionChanged(II)V

    iget-object p0, p0, Lcom/unity3d/player/M;->a:Lcom/unity3d/player/J;

    sub-int/2addr p2, p1

    iget-object p0, p0, Lcom/unity3d/player/J;->b:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {p0, p1, p2}, Lcom/unity3d/player/UnityPlayer;->reportSoftInputSelection(II)V

    return-void
.end method
