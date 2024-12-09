.class final Lcom/unity3d/player/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;

.field private b:Z


# direct methods
.method constructor <init>(Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/unity3d/player/d;->a:Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;

    iput-boolean p2, p0, Lcom/unity3d/player/d;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/d;->a:Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;

    iget-boolean p0, p0, Lcom/unity3d/player/d;->b:Z

    invoke-interface {v0, p0}, Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;->onMobileDataConfirmationResult(Z)V

    return-void
.end method
