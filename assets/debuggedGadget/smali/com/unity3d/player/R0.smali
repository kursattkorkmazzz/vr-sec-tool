.class final Lcom/unity3d/player/R0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unity3d/player/V0;


# direct methods
.method constructor <init>(Lcom/unity3d/player/V0;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/R0;->a:Lcom/unity3d/player/V0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/R0;->a:Lcom/unity3d/player/V0;

    invoke-static {p0}, Lcom/unity3d/player/V0;->-$$Nest$fgeta(Lcom/unity3d/player/V0;)Lcom/unity3d/player/UnityPlayer;

    move-result-object p0

    invoke-virtual {p0}, Lcom/unity3d/player/UnityPlayer;->onPause()V

    return-void
.end method
