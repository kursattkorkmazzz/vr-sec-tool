.class final Lcom/google/androidgamesdk/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/google/androidgamesdk/SwappyDisplayManager;


# direct methods
.method constructor <init>(Lcom/google/androidgamesdk/SwappyDisplayManager;I)V
    .locals 0

    iput-object p1, p0, Lcom/google/androidgamesdk/c;->b:Lcom/google/androidgamesdk/SwappyDisplayManager;

    iput p2, p0, Lcom/google/androidgamesdk/c;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/androidgamesdk/c;->b:Lcom/google/androidgamesdk/SwappyDisplayManager;

    invoke-static {v0}, Lcom/google/androidgamesdk/SwappyDisplayManager;->-$$Nest$fgetmActivity(Lcom/google/androidgamesdk/SwappyDisplayManager;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget p0, p0, Lcom/google/androidgamesdk/c;->a:I

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method
