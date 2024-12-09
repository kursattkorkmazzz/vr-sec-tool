.class final Lcom/unity3d/player/F0;
.super Landroid/telephony/PhoneStateListener;
.source "SourceFile"


# instance fields
.field final synthetic a:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method private constructor <init>(Lcom/unity3d/player/UnityPlayer;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/F0;->a:Lcom/unity3d/player/UnityPlayer;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/unity3d/player/UnityPlayer;Lcom/unity3d/player/F0-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unity3d/player/F0;-><init>(Lcom/unity3d/player/UnityPlayer;)V

    return-void
.end method


# virtual methods
.method public final onCallStateChanged(ILjava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/F0;->a:Lcom/unity3d/player/UnityPlayer;

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p0, p2}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$mnativeMuteMasterAudio(Lcom/unity3d/player/UnityPlayer;Z)V

    return-void
.end method
