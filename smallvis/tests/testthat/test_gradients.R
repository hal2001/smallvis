library(smallvis)
context("Gradients")

perp <- 5

test_that("SNE", {
  test_grad("tsne", perplexity = perp)
  test_grad("ssne", perplexity = perp)
  test_grad("asne", perplexity = perp)
  test_grad("wtsne", perplexity = perp)
  test_grad("wssne", perplexity = perp)
  test_grad("basne", perplexity = perp)
  test_grad("bssne", perplexity = perp)
  test_grad("btsne", perplexity = perp)
  test_grad("btasne", perplexity = perp)
  test_grad("tsneu", perplexity = perp)
  test_grad("skdtsne", perplexity = perp)
  test_grad("usne", perplexity = perp, gr_eps = 1e-10)
  test_grad("cetsne", perplexity = perp)
})

test_that("Norm SNE", {
  test_grad("tasne", perplexity = perp)
  test_grad("tmsne", perplexity = perp)
  test_grad("trmsne", perplexity = perp)
  test_grad("trsrsne", perplexity = perp)
  test_grad("arsrsne", perplexity = perp)
})

test_that("HSSNE", {
  # fd starts losing accuracy for alpha = 0
  test_grad("hssne", perplexity = perp, alpha = 1e-6)
  test_grad("hssne", perplexity = perp, alpha = 0.5)
  test_grad("hssne", perplexity = perp, alpha = 1)
})

test_that("JSE", {
  test_grad("jse", kappa = 0.5, perplexity = perp)
  # fd starts losing accuracy for kappa = 0
  test_grad("jse", kappa = 1e-5, perplexity = perp)
  test_grad("jse", kappa = 1, perplexity = perp)

  test_grad("rsrjse", kappa = 0.5, perplexity = perp)
  test_grad("rsrjse", kappa = 1e-5, perplexity = perp)
  test_grad("rsrjse", kappa = 1, perplexity = perp)
})

test_that("NeRV", {
  test_grad("nerv", lambda = 0.5, perplexity = perp)
  test_grad("nerv", lambda = 0, perplexity = perp)
  test_grad("nerv", lambda = 1, perplexity = perp)

  test_grad("rsrnerv", lambda = 0.5, perplexity = perp)
  test_grad("rsrnerv", lambda = 1e-5, perplexity = perp)
  test_grad("rsrnerv", lambda = 1, perplexity = perp)

  test_grad("bnerv", lambda = 0.5, perplexity = perp)
  test_grad("bnerv", lambda = 1e-5, perplexity = perp)
  test_grad("bnerv", lambda = 1, perplexity = perp)
})

test_that("MDS", {
  test_grad("mmds")
  test_grad("smmds")
  test_grad("sammon")
  test_grad("gmmds", k = perp)
  test_grad("ballmmds")
  test_grad("knnmmds", k = perp)
})

test_that("EE", {
  test_grad("ee", lambda = 1, perplexity = perp)
  test_grad("ee", lambda = 100, perplexity = perp)
  test_grad("ee", lambda = 1000, perplexity = perp)

  test_grad("ee", lambda = 1, neg_weights = FALSE, perplexity = perp)
  test_grad("ee", lambda = 100, neg_weights = FALSE, perplexity = perp)
  test_grad("ee", lambda = 1000, neg_weights = FALSE, perplexity = perp)

  test_grad("tee", lambda = 1, perplexity = perp)
  test_grad("tee", lambda = 0.1, perplexity = perp)
  test_grad("tee", lambda = 0.01, perplexity = perp)
})

test_that("LargeVis", {
  # LV gradients can be extremely large compared to other methods
  test_grad("largevis", tolerance = 1e-3, gamma = 7, perplexity = perp, gr_eps = 0)
  test_grad("largevis", gamma = 1e-3, perplexity = perp, gr_eps = 0)
  test_grad("largevis", tolerance = 1e-2, gamma = 1000, perplexity = perp, gr_eps = 0)
})

test_that("UMAP", {
  test_grad("umap", perplexity = perp, gr_eps = 0)
  test_grad("umap", spread = 10, min_dist = 0.01, perplexity = perp, gr_eps = 0)
  test_grad("umap", spread = 0.5, min_dist = 1e-4, perplexity = perp, gr_eps = 0)
  test_grad("tumap", perplexity = perp, gr_eps = 0)
  test_grad("ntumap", perplexity = perp, gr_eps = 0)
})
