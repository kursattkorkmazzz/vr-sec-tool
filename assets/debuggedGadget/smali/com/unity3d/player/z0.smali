.class final Lcom/unity3d/player/z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/z0;->a:Lcom/unity3d/player/UnityPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/unity3d/player/z0;->a:Lcom/unity3d/player/UnityPlayer;

    invoke-static {v0}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$fgetmMainDisplayOverride(Lcom/unity3d/player/UnityPlayer;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$fgetmGlView(Lcom/unity3d/player/UnityPlayer;)Lcom/unity3d/player/Z;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$fgetmGlView(Lcom/unity3d/player/UnityPlayer;)Lcom/unity3d/player/Z;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/unity3d/player/z0;->a:Lcom/unity3d/player/UnityPlayer;

    invoke-static {p0}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$fgetmGlView(Lcom/unity3d/player/UnityPlayer;)Lcom/unity3d/player/Z;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    const/4 p0, 0x5

    const-string v0, "Couldn\'t add view, because it\'s already assigned to another parent"

    invoke-static {p0, v0}, Lcom/unity3d/player/u;->Log(ILjava/lang/String;)V

    :goto_0
    return-void
.end method
