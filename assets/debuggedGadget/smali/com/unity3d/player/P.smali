.class final Lcom/unity3d/player/P;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field final synthetic a:Lcom/unity3d/player/T;


# direct methods
.method constructor <init>(Lcom/unity3d/player/T;)V
    .locals 0

    iput-object p1, p0, Lcom/unity3d/player/P;->a:Lcom/unity3d/player/T;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    iget-object p0, p0, Lcom/unity3d/player/P;->a:Lcom/unity3d/player/T;

    invoke-virtual {p0}, Lcom/unity3d/player/T;->reportSoftInputArea()V

    return-void
.end method
