.class final Lcom/unity3d/player/k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;II)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/k0;->c:Lcom/unity3d/player/UnityPlayer;

    iput p2, p0, Lcom/unity3d/player/k0;->a:I

    iput p3, p0, Lcom/unity3d/player/k0;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/player/k0;->c:Lcom/unity3d/player/UnityPlayer;

    iget-object v0, v0, Lcom/unity3d/player/UnityPlayer;->mSoftInput:Lcom/unity3d/player/J;

    if-eqz v0, :cond_0

    iget v1, p0, Lcom/unity3d/player/k0;->a:I

    iget p0, p0, Lcom/unity3d/player/k0;->b:I

    iget-object v2, v0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    add-int/2addr p0, v1

    if-lt v2, p0, :cond_0

    iget-object v0, v0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {v0, v1, p0}, Landroid/widget/EditText;->setSelection(II)V

    :cond_0
    return-void
.end method
