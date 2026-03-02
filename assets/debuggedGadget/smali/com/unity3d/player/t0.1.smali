.class final Lcom/unity3d/player/t0;
.super Landroid/view/OrientationEventListener;
.source "SourceFile"


# instance fields
.field final synthetic a:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method constructor <init>(Lcom/unity3d/player/UnityPlayer;Landroid/content/Context;I)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/t0;->a:Lcom/unity3d/player/UnityPlayer;

    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public final onOrientationChanged(I)V
    .locals 1

    iget-object p0, p0, Lcom/unity3d/player/t0;->a:Lcom/unity3d/player/UnityPlayer;

    iget-object v0, p0, Lcom/unity3d/player/UnityPlayer;->m_MainThread:Lcom/unity3d/player/I0;

    invoke-static {p0}, Lcom/unity3d/player/UnityPlayer;->-$$Nest$fgetmNaturalOrientation(Lcom/unity3d/player/UnityPlayer;)I

    move-result p0

    iput p0, v0, Lcom/unity3d/player/I0;->f:I

    iput p1, v0, Lcom/unity3d/player/I0;->g:I

    sget-object p0, Lcom/unity3d/player/G0;->j:Lcom/unity3d/player/G0;

    invoke-static {v0, p0}, Lcom/unity3d/player/I0;->-$$Nest$ma(Lcom/unity3d/player/I0;Lcom/unity3d/player/G0;)V

    return-void
.end method
