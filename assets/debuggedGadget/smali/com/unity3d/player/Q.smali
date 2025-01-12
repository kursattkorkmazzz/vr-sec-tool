.class final Lcom/unity3d/player/Q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field final synthetic a:Lcom/unity3d/player/T;


# direct methods
.method constructor <init>(Lcom/unity3d/player/T;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/Q;->a:Lcom/unity3d/player/T;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/Q;->a:Lcom/unity3d/player/T;

    iget-object p0, p0, Lcom/unity3d/player/J;->f:Lcom/unity3d/player/x;

    if-eqz p0, :cond_0

    check-cast p0, Lcom/unity3d/player/b0;

    invoke-virtual {p0}, Lcom/unity3d/player/b0;->a()V

    :cond_0
    return-void
.end method
