.class final Lcom/unity3d/player/V;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# instance fields
.field private a:Lcom/unity3d/player/U;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Lcom/unity3d/player/U;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    iput-object p2, p0, Lcom/unity3d/player/V;->a:Lcom/unity3d/player/U;

    return-void
.end method


# virtual methods
.method public final deliverSelfNotifications()Z
    .locals 0

    invoke-super {p0}, Landroid/database/ContentObserver;->deliverSelfNotifications()Z

    move-result p0

    return p0
.end method

.method public final onChange(Z)V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/V;->a:Lcom/unity3d/player/U;

    if-eqz p0, :cond_0

    check-cast p0, Lcom/unity3d/player/OrientationLockListener;

    invoke-virtual {p0}, Lcom/unity3d/player/OrientationLockListener;->b()V

    :cond_0
    return-void
.end method
