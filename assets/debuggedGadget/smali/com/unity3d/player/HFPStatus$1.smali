.class Lcom/unity3d/player/HFPStatus$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/player/HFPStatus;->requestHFPStat()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/unity3d/player/HFPStatus;


# direct methods
.method constructor <init>(Lcom/unity3d/player/HFPStatus;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/HFPStatus$1;->a:Lcom/unity3d/player/HFPStatus;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string p1, "android.media.extra.SCO_AUDIO_STATE"

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/unity3d/player/HFPStatus$1;->a:Lcom/unity3d/player/HFPStatus;

    const/4 p2, 0x2

    invoke-static {p1, p2}, Lcom/unity3d/player/HFPStatus;->-$$Nest$fputf(Lcom/unity3d/player/HFPStatus;I)V

    invoke-static {p1}, Lcom/unity3d/player/HFPStatus;->-$$Nest$ma(Lcom/unity3d/player/HFPStatus;)V

    iget-object p0, p0, Lcom/unity3d/player/HFPStatus$1;->a:Lcom/unity3d/player/HFPStatus;

    invoke-static {p0}, Lcom/unity3d/player/HFPStatus;->-$$Nest$fgetc(Lcom/unity3d/player/HFPStatus;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p0}, Lcom/unity3d/player/HFPStatus;->-$$Nest$fgetd(Lcom/unity3d/player/HFPStatus;)Landroid/media/AudioManager;

    move-result-object p0

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setMode(I)V

    :cond_1
    :goto_0
    return-void
.end method
