.class final Lcom/unity3d/player/S0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unity3d/player/V0;


# direct methods
.method constructor <init>(Lcom/unity3d/player/V0;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/S0;->a:Lcom/unity3d/player/V0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/player/S0;->a:Lcom/unity3d/player/V0;

    invoke-static {v0}, Lcom/unity3d/player/V0;->-$$Nest$fgetf(Lcom/unity3d/player/V0;)Lcom/unity3d/player/N0;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/unity3d/player/V0;->-$$Nest$fgeta(Lcom/unity3d/player/V0;)Lcom/unity3d/player/UnityPlayer;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/unity3d/player/UnityPlayer;->addViewToPlayer(Landroid/view/View;Z)Z

    iget-object p0, p0, Lcom/unity3d/player/S0;->a:Lcom/unity3d/player/V0;

    invoke-static {p0, v2}, Lcom/unity3d/player/V0;->-$$Nest$fputi(Lcom/unity3d/player/V0;Z)V

    invoke-static {p0}, Lcom/unity3d/player/V0;->-$$Nest$fgetf(Lcom/unity3d/player/V0;)Lcom/unity3d/player/N0;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    :cond_0
    return-void
.end method
