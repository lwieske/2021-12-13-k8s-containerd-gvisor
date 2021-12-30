---
marp: true
---

<!-- _class: invert -->

## Containerd

* An industry-standard container runtime with an emphasis on 

  * simplicity, 

  * robustness and 

  * portability.

* As of February 28, 2019, containerd is officially a graduated project within
  the Cloud Native Computing Foundation, following Kubernetes, Prometheus,
  Envoy, and CoreDNS.

---

![](https://containerd.io/img/architecture.png)

---

## Containerd - High Level Runtime


* containerd is available as a daemon for Linux and Windows. It manages the
  complete container lifecycle of its host system, from image transfer and
  storage to container execution and supervision to low-level storage to network
  attachments and beyond.

---

## gVisor

* gVisor is an application kernel, written in Go, that implements a substantial
  portion of the Linux system call interface. It provides an additional layer of
  isolation between running applications and the host operating system.

* gVisor includes an Open Container Initiative (OCI) runtime called runsc that
  makes it easy to work with existing container tooling. The runsc runtime
  integrates with Docker, containerd and Kubernetes, making it simple to run
  sandboxed containers.

---

## gVisor (II)

* Containers are not a sandbox. While containers have revolutionized how we
  develop, package, and deploy applications, using them to run untrusted or
  potentially malicious code without additional isolation is not a good idea.
  While using a single, shared kernel allows for efficiency and performance
  gains, it also means that container escape is possible with a single
  vulnerability.

---

## gVisor (III)

* gVisor is an application kernel for containers. It limits the host kernel
  surface accessible to the application while still giving the application
  access to all the features it expects. Unlike most kernels, gVisor does not
  assume or require a fixed set of physical resources; instead, it leverages
  existing host kernel functionality and runs as a normal process. In other
  words, gVisor implements Linux by way of Linux.

---

## gVisor (IV)

* gVisor should not be confused with technologies and tools to harden containers
  against external threats, provide additional integrity checks, or limit the
  scope of access for a service. One should always be careful about what data is
  made available to a container.

---

<!-- _class: invert -->

## Minikube Addon Demo - gVisor

* Minikube supports a simplified configuration of gVisor as an addon:

```
minikube addons enable gvisor
```