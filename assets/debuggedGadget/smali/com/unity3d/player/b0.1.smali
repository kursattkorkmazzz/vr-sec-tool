.class final Lcom/unity3d/player/b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/unity3d/player/x;


# instance fields
.field final synthetic a:Lcom/unity3d/player/c0;


# direct methods
.method constructor <init>(Lcom/unity3d/player/c0;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/b0;->a:Lcom/unity3d/player/c0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    iget-object v0, p0, Lcom/unity3d/player/b0;->a:Lcom/unity3d/player/c0;

    iget-object v0, v0, Lcom/unity3d/player/c0;->m:Lcom/unity3d/player/UnityPlayer;

    invoke-static {v0}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$mnativeSoftInputLostFocus(Lcom/unity3d/player/UnityPlayer;)V

    iget-object p0, p0, Lcom/unity3d/player/b0;->a:Lcom/unity3d/player/c0;

    iget-object p0, p0, Lcom/unity3d/player/c0;->m:Lcom/unity3d/player/UnityPlayer;

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0, v1}, Lcom/unity3d/player/UnityPlayer;->reportSoftInputStr(Ljava/lang/String;IZ)V

    return-void
.end method
