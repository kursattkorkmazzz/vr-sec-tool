.class final Lcom/google/androidgamesdk/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/androidgamesdk/ChoreographerCallback;


# direct methods
.method constructor <init>(Lcom/google/androidgamesdk/ChoreographerCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/google/androidgamesdk/a;->a:Lcom/google/androidgamesdk/ChoreographerCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iget-object p0, p0, Lcom/google/androidgamesdk/a;->a:Lcom/google/androidgamesdk/ChoreographerCallback;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    return-void
.end method
