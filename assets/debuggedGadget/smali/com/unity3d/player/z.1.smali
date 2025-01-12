.class final Lcom/unity3d/player/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Ljava/lang/String;

.field final synthetic b:Lcom/unity3d/player/PermissionFragment;


# direct methods
.method constructor <init>(Lcom/unity3d/player/PermissionFragment;[Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/z;->b:Lcom/unity3d/player/PermissionFragment;

    iput-object p2, p0, Lcom/unity3d/player/z;->a:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/unity3d/player/z;->b:Lcom/unity3d/player/PermissionFragment;

    iget-object p0, p0, Lcom/unity3d/player/z;->a:[Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/unity3d/player/PermissionFragment;->-$$Nest$mreportAllDenied(Lcom/unity3d/player/PermissionFragment;[Ljava/lang/String;)V

    return-void
.end method
