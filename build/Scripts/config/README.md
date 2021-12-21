  apiVersion: v1
  kind: PersistentVolume
  metadata:
    name: task-pv-volume 
    labels:
      type: local
  spec:
    capacity:
      storage: 10Mi
    accessModes:
      - ReadWriteOnce 
    persistentVolumeReclaimPolicy: Delete
    hostPath:
      path: "/CODES" 