.class final Lcom/unity3d/player/L;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unity3d/player/N;


# direct methods
.method constructor <init>(Lcom/unity3d/player/N;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/L;->a:Lcom/unity3d/player/N;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/L;->a:Lcom/unity3d/player/N;

    iget-object v0, v0, Lcom/unity3d/player/J;->c:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object p0, p0, Lcom/unity3d/player/L;->a:Lcom/unity3d/player/N;

    invoke-virtual {p0}, Lcom/unity3d/player/J;->f()V

    return-void
.end method
